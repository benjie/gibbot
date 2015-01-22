# Description:
#   JIRA integration
#
# Commands:
#   hubot how many points is X? - Get the story points for a ticket
#   hubot how many points are in the sprint? - Get the total story points for the sprint
#   hubot list completed issues - Get a list of the completed issues in the current sprint
#   hubot how's the sprint going? - Get information on the current sprint

module.exports = (robot) ->

  moment = require 'moment'

  unless process.env.JIRA_AUTH
    console.log '[WARNING] No Jira auth details are present. Set the JIRA_AUTH environment variable to username:password'

  jira = require('./helpers/jira').create({
    auth: process.env.JIRA_AUTH,
    storyPointsField: 'customfield_10163'
  })

  gibbonBoardId = 53

  robot.respond /how many points (is|has) ([A-Z]+\-\d+)/i, (msg) ->
    jira.getIssueStoryPoints msg.match[2], (err, points) ->
      return msg.send 'There was an error with the Jira API' if err
      if points == undefined
        msg.send "Sorry, I can't seem to find #{msg.match[2]}"
      else
        msg.send "#{msg.match[2]} has #{points || 0} story points"

  robot.respond /how many points are in the sprint/i, (msg) ->
    jira.getBoardStoryPoints gibbonBoardId, (err, points) ->
      return msg.send 'There was an error with the Jira API' if err
      msg.send "There are #{points} story points in the current sprint"

  robot.respond /list completed (issues|stories|tickets)/i, (msg) ->
    jira.getBoardCompletedIssues gibbonBoardId, (err, issues) ->
      return msg.send 'There was an error with the Jira API' if err
      issues = issues.map((issue) -> "#{issue.key}:  #{issue.summary}").join('\n')
      msg.send "Here are the completed stories:\n#{issues}"

  robot.respond /how('?s| is) the sprint going/i, (msg) ->
    jira.getBoard gibbonBoardId, (err, board) ->
      return msg.send 'There was an error with the Jira API' if err

      sprint = board.sprintsData?.sprints?[0]
      sprintName = sprint?.name
      sprintStartDate = moment(sprint?.startDate).format('Do MMM')
      sprintEndDate = moment(sprint?.endDate).format('Do MMM')
      sprintDaysRemaining = sprint?.daysRemaining

      sprintAllIssues = board.issuesData.issues;
      sprintCompletedIssues = board.issuesData.issues.filter((issue) -> issue.done)

      getStoryPointsForIssue = (issue) -> issue.estimateStatistic?.statFieldValue?.value
      sum = (a, b) -> a + (b || 0)
      sprintAllPoints = sprintAllIssues.map(getStoryPointsForIssue).reduce(sum, 0)
      sprintCompletedPoints = sprintCompletedIssues.map(getStoryPointsForIssue).reduce(sum, 0)
      sprintPointsPercentage = Math.round((sprintCompletedPoints / sprintAllPoints) * 100)

      msg.send """
        We're in #{sprintName} with #{sprintDaysRemaining} days left (#{sprintStartDate}–#{sprintEndDate})
        We've completed #{sprintCompletedPoints}/#{sprintAllPoints} points (#{sprintPointsPercentage}%)
        We've completed #{sprintCompletedIssues.length}/#{sprintAllIssues.length} tickets
      """

# Description:
#   JIRA integration
#
# Commands:
#   hubot how many points is X? - Get the story points for a ticket
#   hubot how many points are in the sprint? - Get the total story points for the sprint
#   hubot list completed stories - Get a list of the completed stories in the current sprint

module.exports = (robot) ->

  unless process.env.JIRA_AUTH
    console.log '[WARNING] No Jira auth details are present. Set the JIRA_AUTH environment variable to username:password'

  jira = require('./helpers/jira').create({
    auth: process.env.JIRA_AUTH,
    storyPointsField: 'customfield_10163'
  })

  gibbonBoardId = 53

  robot.respond /how many points (is|has) ([A-Z]+\-\d+)/i, (msg) ->
    jira.getIssueStoryPoints msg.match[2], (err, points) ->
      return msg.reply 'There was an error with the Jira API' if err
      if points == undefined
        msg.reply "Sorry, I can't seem to find #{msg.match[2]}"
      else
        msg.reply "#{msg.match[2]} has #{points || 0} story points"

  robot.respond /how many points are in the sprint/i, (msg) ->
    jira.getBoardStoryPoints gibbonBoardId, (err, points) ->
      return msg.reply 'There was an error with the Jira API' if err
      msg.reply "There are #{points} story points in the current sprint"

  robot.respond /list completed (stories|issues|tickets)/i, (msg) ->
    jira.getBoard gibbonBoardId, (err, board) ->
      return msg.reply 'There was an error with the Jira API' if err
      completedStories = board.issuesData.issues
        .filter((issue) ->
          issue.done
        )
        .map((issue) ->
          "#{issue.key}:  #{issue.summary}"
        )
        .join('\n')
      msg.send "Here are the completed stories:\n#{completedStories}"

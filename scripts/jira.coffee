# Description:
#   JIRA integration
#
# Commands:
#   hubot how many points is X? - Get the story points for a ticket
#   hubot how many points are in the sprint? - Get the total story points for the sprint
#   hubot list completed stories - Get a list of the completed stories in the current sprint

module.exports = (robot) ->

  auth = process.env.JIRA_AUTH
  baseUrl = "http://#{auth}@powerplant.nature.com/jira/rest"
  gibbonBoardId = 53
  unless auth
    console.log '[WARNING] No Jira auth details are present. Set the JIRA_AUTH environment variable to username:password'

  robot.respond /how many points (is|has) ([A-Z]+\-\d+)/i, (msg) ->
    url = "#{baseUrl}/api/latest/issue/#{msg.match[2]}"
    msg.http(url).get() (err, res, body) ->
      try
        issue = JSON.parse body
        points = issue?.fields?.customfield_10163
        if points != undefined && points != null
          msg.reply "#{msg.match[2]} has #{points} story points"
        else
          msg.reply "Sorry, I can't seem to find #{msg.match[2]}"
      catch err
        msg.reply 'There was an error with the Jira API'

  robot.respond /how many points are in the sprint/i, (msg) ->
    url = "#{baseUrl}/greenhopper/1.0/xboard/work/allData/?rapidViewId=#{gibbonBoardId}"
    msg.http(url).get() (err, res, body) ->
      try
        board = JSON.parse body
        totalPoints = board.issuesData.issues
          .filter((issue) ->
            (typeof issue.estimateStatistic?.statFieldValue?.value == 'number')
          )
          .map((issue) ->
            issue.estimateStatistic.statFieldValue.value
          )
          .reduce((total, points) ->
            total + points
          , 0)
        console.log totalPoints
        msg.reply "There are #{totalPoints} story points in the current sprint"
      catch err
        msg.reply 'There was an error with the Jira API'

  robot.respond /list completed (stories|issues|tickets)/i, (msg) ->
    url = "#{baseUrl}/greenhopper/1.0/xboard/work/allData/?rapidViewId=#{gibbonBoardId}"
    msg.http(url).get() (err, res, body) ->
      try
        board = JSON.parse body
        completedStories = board.issuesData.issues
          .filter((issue) ->
            issue.done
          )
          .map((issue) ->
            "#{issue.key}:  #{issue.summary}"
          )
          .join('\n')
        msg.send "Here are the completed stories:\n#{completedStories}"
      catch err
        msg.reply 'There was an error with the Jira API'

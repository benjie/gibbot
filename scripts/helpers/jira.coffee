
request = require 'request'

# Jira API class
class Jira

  # Class constructor
  constructor: (opts) ->
    @opts = opts
    @baseUri = "http://#{@opts.auth}@powerplant.nature.com/jira/rest"

  # GET JSON for an endpoint
  get: (endpoint, done) ->
    request "#{@baseUri}#{endpoint}", (err, res, body) ->
      return done err if err
      try
        body = JSON.parse body
        done null, body
      catch err
        done err

  # Get a single Jira issue
  getIssue: (id, done) ->
    @get "/api/latest/issue/#{id}", done

  # Get story points for a Jira issue
  getIssueStoryPoints: (id, done) ->
    @getIssue id, (err, issue) =>
      return done err if err
      points = issue.fields?[@opts.storyPointsField]
      if points == undefined
        done null, points
      else
        done null, (points || 0)

  # Get a single Jira board
  getBoard: (boardId, done) ->
    @get "/greenhopper/1.0/xboard/work/allData/?rapidViewId=#{boardId}", done

  # Get story points for a Jira board
  getBoardStoryPoints: (boardId, done) ->
    @getBoard boardId, (err, board) ->
      return done err if err
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
      done null, totalPoints

  # Get issues in a Jira board
  getBoardIssues: (boardId, done) ->
    @getBoard boardId, (err, board) ->
      return done err if err
      done null, board.issuesData.issues

  # Get completed issues in a Jira board
  getBoardCompletedIssues: (boardId, done) ->
    @getBoardIssues boardId, (err, issues) ->
      return done err if err
      done null, issues.filter((issue) -> issue.done)

# Convenience function for creating a Jira object
createJiraInstance = (opts) ->
  new Jira opts

# Exports
module.exports = {
  create: createJiraInstance
}

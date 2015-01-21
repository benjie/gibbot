# Description:
#   Get a GTA "wasted" GIF
#
# Commands:
#   hubot waste me - Grab a random GIF from http://www.reddit.com/r/wastedgifs/
#
# Author:
#   rowanmanning

module.exports = (robot) ->
  require('./helpers/me-reddit')({
    robot: robot,
    name: 'waste',
    subreddit: 'wastedgifs'
  })

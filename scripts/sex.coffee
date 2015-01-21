# Description:
#   Lynne, these are sex people!
#
# Commands:
#   None
#

randomBetween = require('./helpers/random').randomBetween

module.exports = (robot) ->
  robot.hear /\b(sex)\b/i, (msg) ->
    if randomBetween(1, 5) == 1
      msg.send 'http://i42.tinypic.com/2e4x53o.gif'

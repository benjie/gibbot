# Description:
#   Gibbot shall respond!
#
# Commands:
#   None
#

randomBetween = require('./helpers/random').randomBetween

module.exports = (robot) ->
  robot.hear /\b(gibbot)\b/i, (msg) ->
    result = randomBetween(1, 50)
    if result == 16
      msg.send 'http://i60.tinypic.com/34hx3fa.png'
    else if result == 24
      msg.send 'http://i62.tinypic.com/11l05xu.jpg'
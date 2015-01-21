# Description:
#   Where is Rowan's coat?
#
# Commands:
#   None
#

module.exports = (robot) ->

  robot.hear /\b(coat|jacket)\b/i, (msg) ->
    msg.send "Where is your #{msg.match[1]}, Rowan?"

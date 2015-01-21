# Description:
#   You've offended gibbot my mentioning his enemies
#
# Commands:
#   None
#

module.exports = (robot) ->
  robot.hear /(hubot|fedbot)/i, (msg) ->
    msg.send 'http://i60.tinypic.com/qoy6uv.gif'
# Description:
#   One million dollars

module.exports = (robot) ->
  robot.hear /\b((1|one|a) million|1,?000,?000)\b/i, (msg) ->
    msg.send 'http://www.reallyvaluable.com/images/dr-evil.gif'

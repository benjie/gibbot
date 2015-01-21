# Description:
#   Respond to greetings
#
# Commands:
#   None

module.exports = (robot) ->

  responses = [
    'Hi %'
    'Hello %'
    'Hey %'
    '\'Sup %'
  ]

  hello = new RegExp("^(hi|hiya|hello|hey|heya) #{robot.name}", 'i')
  helloCommand = new RegExp('(hi|hiya|hello|hey|heya)(\s.*)?', 'i')

  action = (msg) ->
    response = msg.random responses
    msg.send response.replace('%', msg.message.user.name)

  robot.hear hello, action
  robot.respond helloCommand, action

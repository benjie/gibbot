# Description:
#   Respond to thank you
#
# Commands:
#   None

module.exports = (robot) ->

  responses = [
    'It pleases me to please you'
    'My pleasure. Let me know if I can help with anything else!'
    'No need, the smile on your face is a reward in itself'
    'Serving you is an absolute pleasure'
    'Your love is its own reward'
    'Glad I could help'
    'I live to serve'
    'I strive to provide service with a smile :)'
    'I\'m glad I was able to help you'
    'I\'m happy to help'
    'It\'s nothing, really'
    'My pleasure'
    'No bother at all'
    'No problem'
    'No worries'
    'Please, it was nothing'
    'Service with a smile, that\'s my motto'
  ]

  thanks = new RegExp("(thank(s| ?you)|cheers),? #{robot.name}", 'i')
  thanksCommand = new RegExp('(thank(s| ?you)|cheers)', 'i')

  action = (msg) ->
    msg.reply msg.random responses

  robot.hear thanks, action
  robot.respond thanksCommand, action

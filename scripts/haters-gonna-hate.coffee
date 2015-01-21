# Description:
#   Haters gonna hate

module.exports = (robot) ->
  robot.hear /\bhaters (gonna|going to) hate\b/i, (msg) ->
    msg.send 'http://i.imgur.com/NAtS7u3.jpg'

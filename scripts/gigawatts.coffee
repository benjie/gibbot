# Description:
#   1.21 Gigawatts!?

module.exports = (robot) ->
  robot.hear /\b1\.21\b/i, (msg) ->
    msg.send '1.21 Gigawatts!?', 'http://stream1.gifsoup.com/view3/1305979/1-21-gigawatts-o.gif'

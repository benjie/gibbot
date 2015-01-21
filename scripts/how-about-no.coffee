# Description:
#   How about No?

module.exports = (robot) ->
  robot.hear /\bhow about no\b/i, (msg) ->
    msg.send 'http://25.media.tumblr.com/dab57495eec5d1846c2b0293696e4ca6/tumblr_mwguu5k97Q1qaonh9o1_500.gif'

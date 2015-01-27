# Description:
#   Haters gonna hate

module.exports = (robot) ->
  robot.hear /\bhaters (gonna|going to) hate\b/i, (msg) ->
    msg.send 'https://tctechcrunch2011.files.wordpress.com/2012/10/haters-gonna-hate.gif'

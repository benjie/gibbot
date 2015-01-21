# Description:
#   Deal with it
#
# Commands:
#   None

createImageListPage = require './helpers/http-image-list'

module.exports = (robot) ->

  responses = [
    'http://assets.sbnation.com/assets/2434529/post-2164-Deal-with-it-Chuck-Norris-y3FZ_medium.gif'
    'http://awesomegifs.com/wp-content/uploads/The-Dude-Deal-With-It.gif'
    'http://cdn.gifbay.com/2012/09/step_back_and_deal_with_it-244.gif'
    'http://cdn.rsvlts.com/wp-content/uploads/2013/11/2Rt52-Imgur.gif'
    'http://gifatron.com/wp-content/uploads/2013/03/jaqen-deal-with-it-game-of-thrones.gif'
    'http://gifnainteasy.files.wordpress.com/2011/01/deal-with-it-fools.gif'
    'http://i.imgur.com/CupiM.gif'
    'http://i.imgur.com/dz3vf6S.gif'
    'http://images4.fanpop.com/image/photos/23200000/-Deal-with-it-johnny-depp-23271022-500-200.gif'
    'http://img.pandawhale.com/post-28026-Breaking-Bad-deal-with-it-gif-vx91.gif'
    'http://img1.wikia.nocookie.net/__cb20110625165401/icarly/images/0/0e/Oprah-deal-with-it.gif'
    'http://img1.wikia.nocookie.net/__cb20120216211709/glee/images/4/47/Deal-with-it-yoshi_08.gif'
    'http://media.giphy.com/media/GODSCQebffJzW/giphy.gif'
    'http://media2.giphy.com/media/Zo9ACzmJgoqRy/giphy.gif'
    'http://media3.giphy.com/media/4ylyJ7VFq39Mk/giphy.gif'
    'http://media3.giphy.com/media/Nx2Lx1RmLadtC/giphy.gif'
    'http://mrwgifs.com/wp-content/uploads/2013/03/Christian-Bale-Deal-With-It-Reaction-Gif.gif'
    'http://reactiongifs.us/wp-content/uploads/2013/02/deal_with_it_paul_rudd.gif'
    'http://static.fjcdn.com/gifs/Deal+with+it_12e775_4191317.gif'
    'http://static.fjcdn.com/gifs/deal+with+it_3a8792_4248640.gif'
    'http://static.fjcdn.com/gifs/Deal_368aed_1390499.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it1.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it12.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it13.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it19.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it2.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it21.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it24.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it36.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it38.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it43.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it57.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it7.gif'
    'http://www.bite.ca/wp-content/uploads/2013/03/deal-with-it9.gif'
    'http://www.reactionface.info/sites/default/files/images/1311948481105.gif'
    'http://www.reactiongifs.com/wp-content/uploads/2013/06/deal-with-it2.gif'
    'https://i.imgur.com/01ElIVX.gif'
  ]

  robot.hear /\bdeal\s?wi(d|th?)\s?it\b/i, (msg) ->
    msg.send msg.random responses

  createImageListPage(
    robot,
    '/deal-with-it',
    'Deal with it images',
    'A list of all the deal with it images:',
    responses
  )

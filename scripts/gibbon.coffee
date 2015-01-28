# Description:
#   Gibbons!
#
# Commands:
#   hubot gibbon me - Get a random gibbon image
#   hubot gibbon bomb N - Get N gibbon images

module.exports = (robot) ->

  require('./helpers/me-static')(robot, 'gibbon', [
    'http://vignette4.wikia.nocookie.net/uncyclopedia/images/4/48/Funny-monkeys-i.gif/revision/latest?cb=20121120235044'
    'http://i.imgur.com/9kpwA.gif'
    'http://inotternews.com/wp-content/uploads/2014/02/troll-monkey_o_199997.gif'
    'https://jerbearinsantafe.files.wordpress.com/2014/04/wpid-giphy.gif'
    'http://www.gifbin.com/bin/092013/1379436026_zoo_gibbon_attacks_man.gif'
    'http://rack.3.mshcdn.com/media/ZgkyMDEzLzA5LzA1LzEzL2xhd2FuZG9yZGVyLjZlNGVjLmdpZgpwCXRodW1iCTg1MHg4NTA-CmUJanBn/ae0a7754/98d/law-and-order-svu-captain.jpg'
    'http://www.jamiedole.com/gifs/GibbonSquare.gif'
    'http://i.imgur.com/cBCIb8I.gif'
    'http://memecrunch.com/meme/CUM7/gibbon/image.png?w=635&c=1'
    'http://weknowmemes.com/wp-content/uploads/2014/02/on-the-internet-no-one-knows-youre-a-gibbon.jpg'
    'http://comicsbook.be/wp-content/uploads/2014/10/amazingspiderman110-45.jpg'
  ])

# Description:
#   Applause from Orson Welles and others
#
# Author:
#   rowanmanning (adapted from joshfrench's script)

createImageListPage = require './helpers/http-image-list'

module.exports = (robot) ->

  responses = [
    'http://assets0.ordienetworks.com/images/GifGuide/clapping/Kurtclapping.gif'
    'http://assets0.ordienetworks.com/images/GifGuide/clapping/hp3.gif'
    'http://assets0.ordienetworks.com/images/GifGuide/clapping/dwight.gif'
    'http://i.imgur.com/t8zvc.gif'
    'http://replygif.net/i/887.gif'
    'http://replygif.net/i/628.gif'
    'http://replygif.net/i/716.gif'
    'http://replygif.net/i/960.gif'
    'http://replygif.net/i/765.gif'
    'http://replygif.net/i/264.gif'
    'http://replygif.net/i/565.gif'
    'http://replygif.net/i/280.gif'
    'http://replygif.net/i/1196.gif'
    'http://replygif.net/i/173.gif'
    'http://replygif.net/i/675.gif'
    'http://replygif.net/i/468.gif'
    'http://replygif.net/i/95.gif'
    'http://replygif.net/i/861.gif'
    'http://replygif.net/i/335.gif'
    'http://replygif.net/i/462.gif'
    'http://replygif.net/i/483.gif'
    'http://replygif.net/i/801.gif'
    'http://replygif.net/i/238.gif'
    'http://replygif.net/i/1187.gif'
    'http://replygif.net/i/758.gif'
    'http://replygif.net/i/1123.gif'
    'http://replygif.net/i/904.gif'
    'http://replygif.net/i/1425.gif'
    'http://replygif.net/i/1163.gif'
    'http://replygif.net/i/815.gif'
    'http://replygif.net/i/1296.gif'
    'http://replygif.net/i/698.gif'
    'http://replygif.net/i/1294.gif'
    'http://replygif.net/i/532.gif'
    'http://replygif.net/i/775.gif'
    'http://replygif.net/i/90.gif'
    'http://replygif.net/i/807.gif'
    'http://replygif.net/i/125.gif'
    'http://replygif.net/i/1460.gif'
    'http://replygif.net/i/688.gif'
    'http://replygif.net/i/457.gif'
    'http://replygif.net/i/1046.gif'
    'http://replygif.net/i/188.gif'
    'http://replygif.net/i/222.gif'
    'http://replygif.net/i/433.gif'
    'http://replygif.net/i/432.gif'
    'http://replygif.net/i/470.gif'
    'http://replygif.net/i/673.gif'
    'http://replygif.net/i/633.gif'
    'http://replygif.net/i/183.gif'
    'http://replygif.net/i/195.gif'
    'http://replygif.net/i/617.gif'
    'http://replygif.net/i/570.gif'
    'http://replygif.net/i/219.gif'
    'http://replygif.net/i/580.gif'
    'http://i.imgur.com/sG0tVNX.gif'
  ]

  robot.hear /\b(applau(d|se)|bravo|slow clap)\b/i, (msg) ->
    msg.send msg.random responses

  createImageListPage(
    robot,
    '/applause',
    'Applause images',
    'A list of all the applause images:',
    responses
  )

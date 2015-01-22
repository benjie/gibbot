# Description:
#   Gibbot likes chips... But not french fries
#
# Author:
#   mattrayner

createImageListPage = require './helpers/http-image-list'

module.exports = (robot) ->

  responses = [
    'http://i58.tinypic.com/2n1z8tv.gif'
    'http://i62.tinypic.com/2n82cyo.jpg'
  ]

  robot.hear /\b(gibbot chip me)\b/i, (msg) ->
    msg.send msg.random responses

  robot.hear /\b(gibbot french fry me)\b/i, (msg) ->
    msg.send 'http://i62.tinypic.com/11l05xu.jpg'

  createImageListPage(
    robot,
    '/chip-me',
    'Gibbot Chip images',
    'A list of all the chip images:',
    responses
  )

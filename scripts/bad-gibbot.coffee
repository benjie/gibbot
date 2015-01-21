# Description:
#   Gibbot is sad... Sort of
#
# Author:
#   mattrayner (adapted from rowanmanning's applause script)

createImageListPage = require './helpers/http-image-list'

module.exports = (robot) ->

  responses = [
    'http://i58.tinypic.com/33lfqxk.gif'
    'http://i62.tinypic.com/23mk6zq.gif'
    'http://i58.tinypic.com/16bkmtf.gif'
    'http://i62.tinypic.com/zjf0qt.gif'
    'http://i58.tinypic.com/f6iix.gif'
    'http://i62.tinypic.com/x4hqnk.gif'
    'http://i58.tinypic.com/34hz4a0.gif'
  ]

  robot.hear /\b((bad|boo|rubbish) gibbot)\b/i, (msg) ->
    msg.send msg.random responses

  createImageListPage(
    robot,
    '/bad-gibbot',
    'Bid Gibbot images',
    'A list of all the bad-gibbot images:',
    responses
  )

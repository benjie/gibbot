
_ = require 'underscore'
createImageListPage = require './http-image-list'

module.exports = (robot, name, images) ->
  robot.meScriptCount ?= 0
  robot.meScriptCount += 1

  meRegExp = new RegExp "#{name} me", 'i'
  bombRegExp = new RegExp "#{name} bomb( (\\d+))?", 'i'

  robot.respond meRegExp, (msg) ->
    msg.send msg.random images

  robot.respond bombRegExp, (msg) ->
    count = msg.match[2] || 5
    bomb = _.sample images, count
    msg.send image for image in bomb

  routeName = name.replace(' ', '-')
  createImageListPage(
    robot,
    "/me-scripts/#{routeName}",
    "#{robot.name} #{name} me",
    "A list of all the images in #{name} me:",
    images
  )


Select = require('soupselect').select
HtmlParser = require 'htmlparser'

module.exports = (opts) ->
  opts.robot.meScriptCount ?= 0
  opts.robot.meScriptCount += 1

  meRegExp = new RegExp "#{opts.name} me", 'i'

  opts.robot.respond meRegExp, (msg) ->
    getRandomImage msg, (url) ->
      msg.send url if url

  getRandomImage = (msg, done) ->
    msg.http("http://#{opts.tumblr}/random")
      .get() (err, res, body) ->
        console.log res.headers.location
        extractImageFromPage msg, res.headers.location, (location) ->
          done location

  extractImageFromPage = (msg, location, done) ->
    msg.http(location)
      .get() (err, res, body) ->
        handler = new HtmlParser.DefaultHandler()
        parser = new HtmlParser.Parser handler
        parser.parseComplete body
        img = Select handler.dom, opts.selector
        if img && img[0]
          done img[0].attribs.src
        else
          done null

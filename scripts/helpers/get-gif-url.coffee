
request = require 'request'

module.exports = (gif, done) ->
  if gif.match /\/\/(www\.)?gfycat\.com/i
    request getGfycatApiUrl(gif), (err, res, body) ->
      return done err if err
      done err, JSON.parse(body).gfyItem.gifUrl
  else if gif.match(/\/\/(www\.)?imgur\.com/i) and !gif.match(/\.gif$/i)
    done null, gif.replace(/(www\.)?imgur\.com/i, 'i.imgur.com') + '.gif'
  else
    done null, gif

getGfycatApiUrl = (gif) ->
  gif.replace /https?:\/\/(www\.)?gfycat\.com\//i, 'http://gfycat.com/cajax/get/'

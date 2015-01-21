
getGifUrl = require './get-gif-url'

module.exports = (opts) ->
  opts.robot.meScriptCount ?= 0
  opts.robot.meScriptCount += 1

  meRegExp = new RegExp "#{opts.name} me", 'i'

  opts.robot.respond meRegExp, (msg) ->
    getRandomPost msg, (url) ->
      msg.send url + '#.gif'

  getRandomPost = (msg, done) ->
    url = "http://www.reddit.com/r/#{opts.subreddit}/random.json"
    getUrlWithRedirect msg, url, (err, res, body) ->
      try
        posts = JSON.parse body
        getGifUrl posts[0].data.children[0].data.url, (err, url) ->
          done url
      catch err
        console.log err
        done()

  getUrlWithRedirect = (msg, url, done) ->
    url += '?d=' + Date.now() # dirty hack to circumvent Hubot caching
    msg.http(url).get() (err, res, body) ->
      if res.statusCode == 302
        getUrlWithRedirect msg, res.headers.location, done
      else
        console.log url
        done err, res, body

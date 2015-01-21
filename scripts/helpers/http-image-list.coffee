
_ = require 'underscore'

module.exports = (robot, route, title, description, images) ->
  robot.router.get "/images#{route}", (req, res) ->
    imagesHtml = ("<li><img src='#{image}' alt=''/></li>" for image in images).join('')
    res.end """
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="utf-8"/>
          <title>#{title}</title>
          <style>
            ul {
              list-style: none;
              margin: 0;
              padding: 0;
            }
            li {
              margin-bottom: 20px;
            }
            img {
              max-width: 500px;
              max-height: 400px;
            }
          </style>
        </head>
        <body>
          <h1>#{title}</h1>
          <p>#{description}</p>
          <ul>
            #{imagesHtml}
          </ul>
        </body>
      </html>
    """

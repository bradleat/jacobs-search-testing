exports.Google = class Google
  constructor: (path, name) ->
    Controller = require('./controller').Controller
    engine = "Google-Api"
    strip = require('../lib/minify.json.js').Strip
    fs = require('fs')
    querystring = require('querystring')
    req = require('request')
    config = JSON.parse(strip(fs.readFileSync(path, 'utf8')))
    base = "https://www.googleapis.com/customsearch/v1"
    parser = new Controller(engine, config, name)
    req "#{base}?#{querystring.stringify config.params}", (err, res, body) ->
      unless err
        data = JSON.parse body
        for result in data.items
          parser.add_link result.link, result.title, result.snippet

    
    

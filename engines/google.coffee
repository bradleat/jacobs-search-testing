exports.Google = class Google
  constructor: (path) ->
    Controller = require('./controller').Controller
    engine = "Google"
    strip = require('../minify.json.js').Strip
    fs = require('fs')
    querystring = require('querystring')
    req = require('request')
    config = JSON.parse(strip(fs.readFileSync("search/#{path}.json", 'utf8')))
    base = "https://www.googleapis.com/customsearch/v1"
    parser = new Controller(engine, config, 'testing')
    req "#{base}?#{querystring.stringify config.params}", (err, res, body) ->
      unless err
        data = JSON.parse body
        for result in data.items
          parser.add_link result.link, result.title

    
    

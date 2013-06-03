exports.Google = class Google
  constructor: (path) ->
    engine = "Google"
    strip = require('../minify.json.js').Strip
    fs = require('fs')
    querystring = require('querystring')
    req = require('request')
    config = JSON.parse(strip(fs.readFileSync("search/#{path}.json", 'utf8')))
    base = "https://www.googleapis.com/customsearch/v1"
    req "#{base}?#{querystring.stringify config.params}", (err, res, body) ->
      unless err
        console.log config.params
        console.log body

    
    

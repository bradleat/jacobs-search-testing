exports.Google = class Google
  constructor: (query, name) ->
    Controller = require('./controller').Controller
    engine = "Google-Scrape"
    strip = require('../lib/minify.json.js').Strip
    fs = require('fs')
    querystring = require('querystring')
    req = require('request')
    config =
      name: "GOOGLE-SCRAPE"
      params: "ENGLISH-US"

    parser = new Controller(engine, config, name)
    google = require('./google-scrape-en-us.js')
    nextCounter = 0
    google query, 0,(err, next, links) ->
      if err
        throw err
      for link, i in links
        if link.link?
          console.log "#{i + 1}: #{link.link}"
          parser.add_link link.link, link.title, link.description
      if nextCounter < 4
        nextCounter++
        if next
          next()
    
    

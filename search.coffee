#TODO: Add progress tracker
#TODO: Dynamic Load the Engines
#TODO: Console expose things like:
#1. what engine-config are u using
#2. name the current search
argv = require('commander')
argv.version require('./package.json').version
argv.option '-s, --engine [type]', 'Specify a Search Engine Supports: [google]'
argv.option '-q, --query [type]', 'Specify a Query Document [path to query document]'
argv.option '-n, --name [type]', 'Name the current Search (for later use with reports)'
argv.parse process.argv

unless argv.engine? and argv.query? and argv.name?
  console.log "ERROR: An engine, query, and name must all be specified.
               \ncoffee 'search.coffee --help'   for Help ;)"
else if argv.engine is 'google-api'
  Google = require("./engines/google-api.coffee").Google
  @google = new Google(argv.query, argv.name)
else if argv.engine is 'google-scrape'
  Google = require("./engines/google-scrape-base.coffee").Google
  @google = new Google(argv.query, argv.name)

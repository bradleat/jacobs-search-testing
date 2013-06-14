#TODO: Add progress tracker
#TODO: Dynamic Load the Engines
#TODO: Data-View-Report Generation


argv = require('commander')
argv.version require('./../package.json').version
argv.option '-n, --name [type]', 'Name of the search you want to report'
argv.option '-v, --verbose', 'Expanded version of reports'
argv.parse process.argv

unless argv.name?
  console.log "Error: A Session name must be defined.
               \n'coffee search.coffee --help'    for Help ;)"
else
  Graph = require('inkibra-graph').InkibraGraph
  @graph = new Graph()
  @graph.register('has')
  @graph.register('resulted')
  _graph = @graph
  @graph.Node.get "Session_#{argv.name}", (err, config) ->
    console.log "\n CONFIG FOR SEARCH:\n#{config}\n"
  
  @graph.resulted.tracked "Session_#{argv.name}", 1000, (err, res) ->
    unless argv.verbose
      for link, i in res
        console.log "#{i}: #{link}"
      for link, i in res
        #_graph.Node.get link, (err, res1) ->
        await _graph.Node.get link, defer err, res1
        
        convert = (rsp) ->
          try
            return JSON.parse rsp
        
        body = convert res1
        if body?
          if body.link?
            console.log "\n"
            console.log "#{i}: #{body.link}"
            console.log body.about
            console.log "\n"
     else
       for link, i in res when i < 4
        #_graph.Node.get link, (err, res1) ->
        await _graph.Node.get link, defer err, res1
        
        convert = (rsp) ->
          try
            return JSON.parse rsp
        
        body = convert res1
        if body?
          if body.link?
            console.log "\n"
            console.log "#{i}: #{body.link}"
            console.log "\n"
            console.log "#{i}: #{body.html}"
            console.log "\n"

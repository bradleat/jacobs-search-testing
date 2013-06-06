#TODO: Add progress tracker
#TODO: Dynamic Load the Engines
#TODO: Data-View-Report Generation


argv = require('commander')
argv.version require('./package.json').version
argv.option '-n, --name [type]', 'Name of the search you want to report'
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
  
  @graph.resulted._unsafe_all "Session_#{argv.name}", true, (err, res) ->
    for link in res
      console.log link
      _graph.Node.get link, (err, res1) ->
        body = JSON.parse res1
        if body.link?
          console.log "\n"
          console.log body.link
          console.log body.about
          console.log "\n"

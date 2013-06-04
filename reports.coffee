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
  @graph.resulted.strongest "Session_#{argv.name}", 10, true, (err, res) ->
    for link in res
      _graph.Node.get link, (err, res) ->
        body = JSON.parse res
        console.log body.link
        console.log body.about

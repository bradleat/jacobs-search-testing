#TODO: Add progress tracker
#TODO: Dynamic Load the Engines
#TODO: Data-View-Report Generation


Google = require('./engines/google').Google

@google = new Google('google')

Graph = require('inkibra-graph').InkibraGraph
@graph = new Graph()

@graph.Node.get 'http://www.thefreedictionary.com/sample', (err, doc) ->
  console.dir (JSON.parse doc).link

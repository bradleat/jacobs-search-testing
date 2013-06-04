#TODO: Add progress tracker
#TODO: Dynamic Load the Engines
#TODO: Data-View-Report Generation


Graph = require('inkibra-graph').InkibraGraph
#TODO: Console expose paths for:
#1. Getting documents from a session put in a file w/o html
#with information like (how many times was it linked to, during the session)
#2. Getting documents from an engine definition put in a file w/o html
#with ifnromation like how many times was it linked to by the engine
@graph = new Graph()
@graph.register('has')
@graph.register('resulted')

@graph.resulted.strongest 'Session_testing', 10, false, (err, res) ->
  for link in res
    @graph.

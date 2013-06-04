exports.Controller = class Parser
  constructor: (engine, config, search_name) ->
    Graph = require('inkibra-graph').InkibraGraph
    @graph = new Graph()
    @get = require('request')

    @result_node =
      document: ""
      link: ""

    @searchSession_node =
      engine_name: engine
      search_name: search_name
      params: config.params

    @engineConfig_node =
      name: config.name

    @graph.register('has')
    @graph.register('resulted')

    @graph.Node.insert "#{engine}_#{config.name}", JSON.stringify @engineConfig_node, (err, res) ->
      if err
        throw err

    @graph.Node.insert "Session_#{search_name}", JSON.stringify @searchSession_node, (err, res) ->
      if err
        throw err
    @graph.has.link "#{engine}_#{config.name}", "Session_#{search_name}", (err, res) ->
      if err
        throw err

  add_link: (link, title, snippet) =>
    _graph = @graph
    _searchName = @searchSession_node.search_name
    @get link, (err, res, body) ->
      _store =
        html: body
        tile: title
        link: link
        about: snippet

      _store = JSON.stringify _store

      _graph.Node.insert link, _store, (err, res) ->
        if err
          throw err
        else
          _graph.resulted.link "Session_#{_searchName}", link, (err, res) ->
            if err
              throw err

  


exports.Controller = class Parser
  constructor: (engine, config, search_guid) ->


    @result_node =
      document: ""
      link: ""

    @searchSession_node =
      engine_name: engine
      search_id: search_guid
      search_params: config.params

    @engineConfig_node =
      name: config.name

    #TODO: register engineConfig node


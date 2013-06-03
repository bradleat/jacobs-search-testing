InkibraGraph = require('./node_modules/inkibra-graph/app.coffee').InkibraGraph

#@graph = new InkibraGraph()

Google = require('./engines/google').Google
@google = new Google('google')

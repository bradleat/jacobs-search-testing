#TODO: Add progress tracker
#TODO: Dynamic Load the Engines
#TODO: Console expose things like:
#1. what engine-config are u using
#2. name the current search

Google = require('./engines/google').Google

@google = new Google('google')

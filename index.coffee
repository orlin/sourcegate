require("source-map-support").install()

merge = require("lodash.merge")
path = require("path")
read = (sources) ->
  objects = []
  for source in sources
    if typeof source is "object"
      objects.push source
    else if typeof source is "string"
      objects.push require(path.join(process.cwd(), path.normalize(source)))
  objects

module.exports = (sources = []) ->
  unless sources.length > 0
    {}
  else
    objects = read(sources)
    if sources.length is 1
      sources[0]
    else
      merge.apply null, objects

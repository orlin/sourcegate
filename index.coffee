require("source-map-support").install()

merge = require("lodash.merge")
path = require("path")
read = (sources, opts) ->
  opts.relative ?= true
  root =
    if opts.relative and opts.root?
      path.join process.cwd(), opts.root
    else
      opts.root || process.cwd()

  objects = []
  for source in sources
    if typeof source is "object"
      objects.push source
    else if typeof source is "string"
      objects.push require(path.join(root, path.normalize(source)))
  objects

module.exports = (sources = [], opts = {}) ->
  unless sources.length > 0
    {}
  else
    objects = read sources, opts
    if objects.length is 1
      objects[0]
    else
      opts.merge ?= true
      if opts.merge
        # merge mutates the first object
        objects.unshift {}
        merge.apply null, objects
      else
        objects

_ = require "underscore"
merge = require "deepmerge"

class SourceGate

  # the rules object
  o: {}

  # gets one set of rules
  f: (what) ->
    if _.isObject what
      @use(what).f _.first _.keys what
    else
      @o[what] ? {}

  # several sets of rules to follow, return all when list is empty
  says: (list = []) ->
    _.pick @o, list

  # use of rules deep-merges the given over what's already present
  use: (over = {}) ->
    @o = merge @o, over
    this # can chain use calls

module.exports = new SourceGate

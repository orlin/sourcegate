_ = require "lodash"

class SourceGate

  stuff: {}
  emptyness: -> {}

  # can get only one item from all the stuff
  # first, deep-merges any object into stuff, if that's what `what` is
  o: (what) ->
    if _.isString what
      @stuff[what] ? @emptyness()
    else if _.isObject what
      @use(what).o _.first _.keys what
    else @emptyness()

  # several items of stuff to get, return all when list is empty
  pick: (list = []) ->
    return @stuff if _.isEmpty list
    picked = _.pick @stuff, list
    unless _.isEmpty picked then picked else @emptyness()

  # use of stuff deep-merges the given over what's already present
  use: (over = {}) ->
    @stuff = _.merge @stuff, over
    this # can chain `@use` calls

module.exports = new SourceGate

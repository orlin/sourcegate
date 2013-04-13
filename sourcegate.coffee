_ = require "lodash"

class SourceGate

  rules: {}
  default: {}

  # gets one set of rules, possibly deep-merges some first
  # i.e. `o` overrides when `what` is an object
  o: (what) ->
    if _.isString what
      @rules[what] ? @default
    else if _.isObject what
      @use(what).o _.first _.keys what
    else @default

  # several sets of rules to follow, return all when list is empty
  says: (list = []) ->
    _.pick @rules, list

  # use of rules deep-merges the given over what's already present
  use: (over = {}) ->
    @rules = _.merge @rules, over
    this # can chain `@use` calls

module.exports = new SourceGate

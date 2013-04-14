#!/usr/bin/env coffee

sg = require "../index"
test = require("trap").test
assert = require("chai").assert

test "defaults", ->
  assert.deepEqual sg.o(), sg.emptyness(), "an empty sourcegate returns emptyness"

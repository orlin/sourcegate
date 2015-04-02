#!/usr/bin/env mocha

describe "sourcegate", ->
  describe "odd cases", ->
    it "returns {} if given no arguments", ->
      expect(sg()).to.eql {}
    it "returns {} if given an empty array", ->
      expect(sg([])).to.eql {}
    it "given an array with a single object, returns that object", ->
      expect(sg([{a: "whatever"}])).to.eql {a: "whatever"}

  describe "json / objects", ->
    it "can deep-merge objects", ->
      expect(sg([{a: 1, m: {b: 2}},{m: {b: "2b", c: 3}}]))
        .to.eql {a: 1, m: {b: "2b", c: 3}}
    it "can deep-merge json file objects", ->
      expect(sg(["test/files/1.json", "test/files/2.json"]))
        .to.eql {a: 1, m: {b: "2b", c: 3}}

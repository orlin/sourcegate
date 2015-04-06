#!/usr/bin/env mocha

fs = require("fs")
path = require("path")
[one, two] = sg(['1.json', '2.json'], {root: 'test/files', merge: false})
outPath = "test/files/out.json"

describe "sourcegate", ->

  describe "odd cases", ->
    it "returns {} if given no arguments", ->
      expect(sg()).to.eql {}
    it "returns {} if given an empty array", ->
      expect(sg([])).to.eql {}
    it "given an array with a single object, returns that object", ->
      expect(sg([{a: "whatever"}])).to.eql {a: "whatever"}
    it "given an array with a single file path, returns the contents", ->
      expect(sg(["test/files/1.json"]))
        .to.eql one

  describe "json / objects", ->
    it "can deep-merge objects", ->
      expect(sg([{a: 1, m: {b: 2}},{m: {b: "2b", c: 3}}]))
        .to.eql {a: 1, m: {b: "2b", c: 3}}
    it "can deep-merge json file objects", ->
      expect(sg(["test/files/1.json", "test/files/2.json"]))
        .to.eql {a: 1, m: {b: "2b", c: 3}}

  describe "config opts", ->
    it "can take a root path, relative by default", ->
      expect(sg(['1.json'], {root: 'test/files'}))
        .to.eql one
    it "can take an absolute root path", ->
      expect(sg(['2.json'],
        root: path.join(process.cwd(), 'test/files'),
        relative: false
      )).to.eql two

  describe "-", ->

    beforeEach -> try fs.unlinkSync outPath
    afterEach -> try fs.unlinkSync outPath

    it "can write the result given a file path", ->
      expect(sg(['1.json'], {root: 'test/files', write: {path: "out.json"}}))
        .to.eql one
      expect(JSON.parse(fs.readFileSync(outPath))).to.eql one

    it "can read json files without .json extension", ->
      expect(sg(['1.jsonrc'], {root: 'test/files', write: {path: "out.json"}}))
        .to.eql one
      expect(JSON.parse(fs.readFileSync(outPath))).to.eql one

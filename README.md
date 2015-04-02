# sourcegate -- have any object you want

## Use

[![NPM](https://nodei.co/npm/sourcegate.png?mini=true)](https://www.npmjs.org/package/sourcegate)

Give it an array of paths to json files, or js objects.
They will be deep-merged, left to right, using `lodash.merge`.

```javascript
var sg = require('sourcegate');
var merged = sg(['initialize.json', 'customize/config.json', {c: 3}])
```

### Configure

Sourcegate takes a second argument with the following default options:

```javascript
{
  root: process.cwd(),
  relative: true,
  merge: true
}
```

If the root path is set, it can be relative (by default), or absolute.

Notice that merging is actually optional. That was added for the tests,
though it could be useful elsewhere for simply loading files to memory.

## Test [![Build Status](https://img.shields.io/travis/orlin/sourcegate.svg?style=flat)](https://travis-ci.org/orlin/sourcegate)

```sh
npm test
```

## Unlicensed

This is free and unencumbered public domain software.
For more information, see [UNLICENSE](http://unlicense.org).

# sourcegate -- have any object you want

## Use

[![NPM](https://nodei.co/npm/sourcegate.png?compact=true)](https://www.npmjs.org/package/sourcegate)

Give it an array of paths to json files, or js objects.
They will be deep-merged, left to right, using `lodash.merge`.

```javascript
var sg = require('sourcegate');
var merged = sg(['initialize.json', 'customize/config.json', {c: 3}])
```

If you are using this to write linter rules, and even if not,
you should look into [hal-rc](https://github.com/orlin/hal-rc) or best
[beverage](https://github.com/orlin/beverage).

### Configure

Sourcegate takes a second argument with the following default options:

```javascript
{
  root: process.cwd(),
  relative: true,
  merge: true,
  write: {
    path: '', // a file name or path is required to enable writing it
    options: {},
    root: process.cwd(), // optional
    relative: true // optional
  },
  async: false // always the case so far...
}
```

If the root path is set, it can be relative (by default), or absolute.

Notice that merging is actually optional. That was added for the tests,
though it could be useful elsewhere for simply loading files to memory.

The `write` is optional, enabled by `write.path`.  The `options` are handed to [node](https://nodejs.org/api/fs.html#fs_fs_writefile_filename_data_options_callback).
The `write.root` and `write.relative` are same as the ones used for reading,
unless they are explicitly made different.

## Missing

Some day there may be an async implementation.
I so far use it only for workflow tasks, thus async hasn't been needed.

## Test [![Build Status](https://img.shields.io/travis/orlin/sourcegate.svg?style=flat)](https://travis-ci.org/orlin/sourcegate)

```sh
npm test
```

## Unlicensed

This is free and unencumbered public domain software.
For more information, see [UNLICENSE](http://unlicense.org).

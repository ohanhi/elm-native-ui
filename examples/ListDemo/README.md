# ListDemo Example

Assuming you already have react-native and elm setup. From the command
line run in the examples directory (not this directory!):

```bash
$ react-native init ListDemo
```

When asked if you want to overwrite index.ios.js and index.android.js
- decline with "n"

Using git revert the changes react-native made to the package.json file
and run:

```bash
$ cd ListDemo
$ npm run compile
```

finally:

```bash
$ react-native run-ios
```

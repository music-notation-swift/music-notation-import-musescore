![music-notation](https://user-images.githubusercontent.com/62043/111560932-cf4d1180-8750-11eb-842e-3159015c61ab.png)

[![Platform](https://img.shields.io/badge/Platforms-macOS%20-lightgrey.svg)](https://github.com/music-notation-swift/music-notation-import-musescore)
![Swift 6.0](https://img.shields.io/badge/Swift-6.0-F28D00.svg)
![Coverage Badge](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/woolie/b9f858cfba09911bd1755bdc40dd5a35/raw/music-notation-import-guitarpro__heads_main.json)

# music-notation-import-musescore

`music-notation` import code specific to MuseScore 4 files.

### MuseScore 4

MuseScore 4 ...

## Dependencies

- [SWXMLHash](https://github.com/drmohundro/SWXMLHash)

  Used to parse the XML data in the GuitarPro files.

- [ZIPFoundation](https://github.com/weichsel/ZIPFoundation)

  Used to find the XML file within the MuseScore file (which is just a folder zipped with some files in it)

## Notes

This is (obviously) a work in progress. It is meant to drive and help develop the `music-notation` project. It is one of the packages used by [music-notation-import](https://github.com/music-notation-swift/music-notation-import)

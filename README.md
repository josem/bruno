# Bruno
Bruno is a small tool to convert your Localizable.strings (iOS) files into strings.xml (Android) and viceversa. 

## Installation
To install Bruno:
```bash
gem install bruno
```

## Examples

From iOS to Android:
```bash
bruno convert --in Localizable.strings --out strings.xml
```

Or, if you already have the strings.xml file:
```bash
bruno convert --in strings.xml --out Localizable.strings
```

Bruno will detect automatically the format for you, so the name of the file does not matter.


## Author
José M. Gilgado

##License
MIT License
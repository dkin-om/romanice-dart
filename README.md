# romanice - Convert to/from Roman numerals

[![Version](https://img.shields.io/pub/v/romanice)](https://pub.dev/packages/romanice)
[![Build Status](https://travis-ci.com/dkin-om/romanice-dart.svg?branch=master)](https://travis-ci.com/dkin-om/romanice-dart)
[![Coverage Status](https://coveralls.io/repos/github/dkin-om/romanice-dart/badge.svg)](https://coveralls.io/github/dkin-om/romanice-dart)
[![License](https://img.shields.io/badge/license-MIT-green)](https://github.com/dkin-om/romanice-dart/blob/master/LICENSE)

A Dart library for converting to/from Roman numerals, e.g., `3888`↔`MMMDCCCLXXXVIII`, `38888`↔`ↂↂↂↁↀↀↀⅮⅭⅭⅭⅬⅩⅩⅩⅤⅠⅠⅠ`

## Usage

See `example/romanice_example.dart`

### Standard - `I`, `V`, `X`, `L`, `C`, `D`, `M`

```dart
final Romanice standardConverter = Romanice();

final String roman = standardConverter.toRoman(3888);
// roman == 'MMMDCCCLXXXVIII'

final int decimal = standardConverter.fromRoman('MMMCMXCIX');
// decimal == 3999
```

### Unicode - `Ⅰ`, `Ⅴ`, `Ⅹ`, `Ⅼ`, `Ⅽ`, `Ⅾ`, `ↀ`, `ↁ`, `ↂ`

```dart
final Romanice unicodeConverter = Romanice.unicode();

final String roman = unicodeConverter.toRoman(38888);
// roman == 'ↂↂↂↁↀↀↀⅮⅭⅭⅭⅬⅩⅩⅩⅤⅠⅠⅠ'

final int decimal = unicodeConverter.fromRoman('ↂↂↂↀↂⅭↀⅩⅭⅠⅩ');
// decimal == 39999
```

## Syntax

### *`Romanice([List<String> _symbols])`*

*`_symbols`* - List of Roman numeral symbols representing the character set. If omitted, assumes the standard symbols `['I', 'V', 'X', 'L', 'C', 'D', 'M']`.

See [documentation](https://pub.dev/documentation/romanice) for more

## License

[MIT](https://github.com/dkin-om/romanice-dart/blob/master/LICENSE)

# romanice - Convert to/from Roman numerals

[![Version](https://img.shields.io/pub/v/romanice)](https://pub.dev/packages/romanice)
[![Build Status](https://travis-ci.com/dkin-om/romanice-dart.svg?branch=master)](https://app.travis-ci.com/github/dkin-om/romanice-dart)
[![Coverage Status](https://coveralls.io/repos/github/dkin-om/romanice-dart/badge.svg)](https://coveralls.io/github/dkin-om/romanice-dart)
[![License](https://img.shields.io/badge/license-MIT-green)](https://github.com/dkin-om/romanice-dart/blob/master/LICENSE)

A Dart library for converting to/from Roman numerals, e.g., `3888`↔`MMMDCCCLXXXVIII`, `38888`↔`ↂↂↂↁↀↀↀⅮⅭⅭⅭⅬⅩⅩⅩⅤⅠⅠⅠ`

## Usage

See `example/main.dart`

### Standard - `I`, `V`, `X`, `L`, `C`, `D`, `M`

```dart
final ToRoman standardToRoman = ToRoman();

final String roman = standardToRoman(3888);
// roman == 'MMMDCCCLXXXVIII'

final int decimal = standardToRoman.inverse()('MMMCMXCIX');
// decimal == 3999
```

### Unicode - `Ⅰ`, `Ⅴ`, `Ⅹ`, `Ⅼ`, `Ⅽ`, `Ⅾ`, `ↀ`, `ↁ`, `ↂ`

```dart
final FromRoman unicodeFromRoman = FromRoman.unicode();

final String roman = unicodeFromRoman.inverse()(38888);
// roman == 'ↂↂↂↁↀↀↀⅮⅭⅭⅭⅬⅩⅩⅩⅤⅠⅠⅠ'

final int decimal = unicodeFromRoman('ↂↂↂↀↂⅭↀⅩⅭⅠⅩ');
// decimal == 39999
```

## Syntax

### *`ToRoman([List<String> _symbols])`*

### *`FromRoman([List<String> _symbols])`*

*`_symbols`* - List of Roman numeral symbols representing the character set. If omitted, assumes the standard symbols `['I', 'V', 'X', 'L', 'C', 'D', 'M']`.

See [documentation](https://pub.dev/documentation/romanice) for more

## License

[MIT](https://github.com/dkin-om/romanice-dart/blob/master/LICENSE)

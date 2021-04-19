import 'package:invertible/invertible.dart';

import 'symbol_utils.dart';
import 'to_roman.dart';

/// Provides ability to represent Roman numerals as Decimal integers
class FromRoman extends InvertibleFunction<String, int> {
  /// Constructs a FromRoman object with the given charset - [_symbols]
  FromRoman([this._symbols = standardSymbols])
      : _romanNumeralRegExp = romanNumeralRegExp(_symbols) {
    if (!areValidSymbols(_symbols)) {
      throw ArgumentError.value(_symbols, '_symbols',
          'Invalid charset, symbols must be non-empty and distinct, e.g. I, V, X, L, C, D, M');
    }
  }

  /// Constructs a FromRoman object with the standard charset - I, V, X, L, C, D, M
  FromRoman.standard() : this(standardSymbols);

  /// Constructs a FromRoman object with the unicode charset - Ⅰ, Ⅴ, Ⅹ, Ⅼ, Ⅽ, Ⅾ, ↀ, ↁ, ↂ
  FromRoman.unicode() : this(unicodeSymbols);

  final List<String> _symbols;

  final RegExp _romanNumeralRegExp;

  @override
  List<bool Function(String)> get domain => <bool Function(String)>[
        (String x) => _romanNumeralRegExp.firstMatch(x) != null
      ];

  @override
  int valueAt(String x) {
    if (x.isEmpty) return 0;

    final Match match = _romanNumeralRegExp.firstMatch(x)!;

    int result = 0;

    for (int idx = 1; idx <= match.groupCount; idx += 1) {
      final int i = 2 * (match.groupCount - idx);
      final String group = match.group(idx)!;

      int count = 0;
      if (group.startsWith(_symbols[i])) {
        if (group.endsWith(_symbols[i])) {
          count = group.length;
        } else if (group.endsWith(_symbols[i + 1])) {
          count = 4;
        } else if (group.endsWith(_symbols[i + 2])) {
          count = 9;
        }
      } else if (i + 1 < _symbols.length && group.startsWith(_symbols[i + 1])) {
        count = 4 + group.length;
      }

      result += valueOfSymbolAt(i) * count;
    }

    return result;
  }

  @override
  ToRoman inverse() => ToRoman(_symbols);
}

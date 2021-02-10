import 'converter.dart' as converter;
import 'symbols.dart';

bool _areDistinct(List<String> symbols) {
  final Map<String, bool> cache = <String, bool>{};
  return symbols.every((String s) {
    cache[s] = cache[s] == null;
    return cache[s];
  });
}

/// Provides ability to represent Decimal numbers as Roman numerals, and vice versa.
class Romanice {
  /// Constructs a Romanice object with the given charset - [_symbols].
  Romanice([this._symbols = standardSymbols]) {
    if (!(_symbols.isNotEmpty && _areDistinct(_symbols))) {
      throw ArgumentError.value(_symbols, '_symbols',
          'Invalid charset, symbols must be non-empty and distinct, e.g. I, V, X, L, C, D, M');
    }
  }

  /// Constructs a Romanice object with the standard charset - I, V, X, L, C, D, M.
  Romanice.standard() : this(standardSymbols);

  /// Constructs a Romanice object with the unicode charset - Ⅰ, Ⅴ, Ⅹ, Ⅼ, Ⅽ, Ⅾ, ↀ, ↁ, ↂ.
  Romanice.unicode() : this(unicodeSymbols);

  final List<String> _symbols;

  /// Returns the Roman numeral representation of the [number].
  ///
  /// ```dart
  /// Romanice.standard().toRoman(3888) == 'MMMDCCCLXXXVIII'
  /// ```
  String toRoman(int number) => converter.toRoman(number, _symbols);

  /// Returns the Decimal representation of the [number].
  ///
  /// ```dart
  /// Romanice.standard().fromRoman('MMMDCCCLXXXVIII') == 3888
  /// ```
  int fromRoman(String number) => converter.fromRoman(number, _symbols);
}

import 'dart:math';

/// Standard charset - I, V, X, L, C, D, M.
const List<String> standardSymbols = <String>[
  'I', // 1
  'V', // 5
  'X', // 10
  'L', // 50
  'C', // 100
  'D', // 500
  'M', // 1000
];

/// Unicode charset - Ⅰ, Ⅴ, Ⅹ, Ⅼ, Ⅽ, Ⅾ, ↀ, ↁ, ↂ.
const List<String> unicodeSymbols = <String>[
  'Ⅰ', // 1
  'Ⅴ', // 5
  'Ⅹ', // 10
  'Ⅼ', // 50
  'Ⅽ', // 100
  'Ⅾ', // 500
  'ↀ', // 1000
  'ↁ', // 5000
  'ↂ', // 10000
];

/// Checks if [symbols] is a valid charset
bool areValidSymbols(List<String> symbols) {
  if (symbols.isEmpty || symbols.length != symbols.toSet().length) return false;
  return symbols.every((String s) => s.length == 1);
}

/// Returns the decimal value of the symbol at index [idx]
int valueOfSymbolAt(int idx) {
  if ((idx % 2) == 0) return pow(10, (idx ~/ 2)).round();
  return 5 * valueOfSymbolAt(idx - 1);
}

/// Returns the biggest decimal number that can be written
/// in roman numeral representation
int biggestRepresentableNumber(int numberOfSymbols) {
  final int sb = (numberOfSymbols % 2) == 0
      ? (numberOfSymbols - 2)
      : (numberOfSymbols - 1);
  return valueOfSymbolAt(numberOfSymbols) - valueOfSymbolAt(sb) - 1;
}

/// Returns the roman numeral regular expression of [symbols] charset
RegExp romanNumeralRegExp(List<String> symbols) {
  String numRegex = '';
  for (int i = 0; i < symbols.length; i += 2) {
    String digitRegex = '${symbols[i]}{0,3}';
    if (i + 1 < symbols.length) {
      digitRegex +=
          '|${symbols[i]}${symbols[i + 1]}|${symbols[i + 1]}${symbols[i]}{0,3}';
    }
    if (i + 2 < symbols.length) {
      digitRegex += '|${symbols[i]}${symbols[i + 2]}';
    }
    numRegex = '($digitRegex)$numRegex';
  }

  return RegExp('^$numRegex\$');
}

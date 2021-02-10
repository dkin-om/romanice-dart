import 'dart:math';

int _valueOfSymbolAt(int idx) {
  if ((idx % 2) == 0) return pow(10, (idx ~/ 2));
  return 5 * _valueOfSymbolAt(idx - 1);
}

int _maxPossibleValue(int size) {
  final int sb = (size % 2) == 0 ? (size - 2) : (size - 1);
  return _valueOfSymbolAt(size) - _valueOfSymbolAt(sb) - 1;
}

/// Returns the Roman numeral representation of the [number].
String toRoman(int number, List<String> symbols) {
  final int max = _maxPossibleValue(symbols.length);
  if (!(number >= 0 && number <= max)) {
    throw RangeError.range(number, 0, max, 'number');
  }

  final List<String> result = <String>[];

  int n = number;

  for (int i = symbols.length - 1; i >= 0; i -= 1) {
    final int value = _valueOfSymbolAt(i);

    final int count = n ~/ value;

    if (count < 4) {
      for (int j = 0; j < count; j += 1) {
        result.add(symbols[i]);
      }
    } else if (count == 4) {
      if (result.isEmpty || result.last != symbols[i + 1]) {
        result.add(symbols[i]);
        result.add(symbols[i + 1]);
      } else {
        result.removeLast();
        result.add(symbols[i]);
        result.add(symbols[i + 2]);
      }
    } else {
      // count > 4 is not possible
    }

    n -= value * count;
  }

  return result.join('');
}

/// Returns the Decimal representation of the [number].
int fromRoman(String number, List<String> symbols) {
  if (number.isEmpty) return 0;

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

  final Match match = RegExp('^$numRegex\$').firstMatch(number);

  if (match == null) {
    throw ArgumentError.value(
        number, 'number', 'Invalid roman numeral representation');
  }

  int result = 0;

  for (int idx = 1; idx <= match.groupCount; idx += 1) {
    final int i = 2 * (match.groupCount - idx);
    final String group = match.group(idx);

    int count = 0;
    if (group.startsWith(symbols[i])) {
      if (group.endsWith(symbols[i])) {
        count = group.length;
      } else if (group.endsWith(symbols[i + 1])) {
        count = 4;
      } else if (group.endsWith(symbols[i + 2])) {
        count = 9;
      }
    } else if (i + 1 < symbols.length && group.startsWith(symbols[i + 1])) {
      count = 4 + group.length;
    }

    result += _valueOfSymbolAt(i) * count;
  }

  return result;
}

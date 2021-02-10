import 'package:romanice/romanice.dart';

void main() {
  standard();
  unicode();
  custom();
}

void standard() {
  // Standard charset - I, V, X, L, C, D, M
  final Romanice standardConverter = Romanice.standard(); // or just Romanice()

  final String roman = standardConverter.toRoman(3888);
  print(
      'standard: 3888 is represented as $roman in Roman numerals'); // MMMDCCCLXXXVIII

  final int decimal = standardConverter.fromRoman('MMMCMXCIX');
  print('standard: MMMCMXCIX is represented as $decimal in Decimal'); // 3999
}

void unicode() {
  // Unicode charset - Ⅰ, Ⅴ, Ⅹ, Ⅼ, Ⅽ, Ⅾ, ↀ, ↁ, ↂ
  final Romanice unicodeConverter = Romanice.unicode();

  final String roman = unicodeConverter.toRoman(38888);
  print(
      'unicode: 38888 is represented as $roman in Roman numerals'); // ↂↂↂↁↀↀↀⅮⅭⅭⅭⅬⅩⅩⅩⅤⅠⅠⅠ

  final int decimal = unicodeConverter.fromRoman('ↂↂↂↀↂⅭↀⅩⅭⅠⅩ');
  print('unicode: ↂↂↂↀↂⅭↀⅩⅭⅠⅩ is represented as $decimal in Decimal'); // 39999
}

void custom() {
  // Custom charset - D, K, I, N, O, M
  final Romanice dkinomConverter =
      Romanice(<String>['D', 'K', 'I', 'N', 'O', 'M']);

  final String roman = dkinomConverter.toRoman(888);
  print(
      'custom: 888 is represented as $roman in Roman numerals'); // MOOONIIIKDDD

  final int decimal = dkinomConverter.fromRoman('MOOOIODI');
  print('custom: MOOOIODI is represented as $decimal in Decimal'); // 899
}

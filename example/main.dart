import 'package:romanice/romanice.dart';

void main() {
  standard();
  unicode();
  custom();
}

void standard() {
  // Standard charset - I, V, X, L, C, D, M
  final ToRoman standardToRoman = ToRoman.standard(); // or just ToRoman()

  final String roman = standardToRoman(3888);
  print(
      'standard: 3888 is represented as $roman in Roman numerals'); // MMMDCCCLXXXVIII

  final int decimal = standardToRoman.inverse()('MMMCMXCIX');
  print('standard: MMMCMXCIX is represented as $decimal in Decimal'); // 3999
}

void unicode() {
  // Unicode charset - Ⅰ, Ⅴ, Ⅹ, Ⅼ, Ⅽ, Ⅾ, ↀ, ↁ, ↂ
  final ToRoman unicodeToRoman = ToRoman.unicode();

  final String roman = unicodeToRoman(38888);
  print(
      'unicode: 38888 is represented as $roman in Roman numerals'); // ↂↂↂↁↀↀↀⅮⅭⅭⅭⅬⅩⅩⅩⅤⅠⅠⅠ

  final int decimal = unicodeToRoman.inverse()('ↂↂↂↀↂⅭↀⅩⅭⅠⅩ');
  print('unicode: ↂↂↂↀↂⅭↀⅩⅭⅠⅩ is represented as $decimal in Decimal'); // 39999
}

void custom() {
  // Custom charset - D, K, I, N, O, M
  final FromRoman dkinomFromRoman =
      FromRoman(<String>['D', 'K', 'I', 'N', 'O', 'M']);

  final String roman = dkinomFromRoman.inverse()(888);
  print(
      'custom: 888 is represented as $roman in Roman numerals'); // MOOONIIIKDDD

  final int decimal = dkinomFromRoman('MOOOIODI');
  print('custom: MOOOIODI is represented as $decimal in Decimal'); // 899
}

import 'package:test/test.dart';

import 'custom_converter_testcase.dart';
import 'standard_converter_testcase.dart';
import 'unicode_converter_testcase.dart';

void main() {
  testConverter(standardConverter);
  testConverter(unicodeConverter);
  testConverter(dkinomConverter);
}

void testConverter(Map<String, dynamic> converter) {
  group('toRoman', () {
    converter['testCases'].forEach((Map<String, dynamic> testCase) {
      test('${testCase['decimal']} -> ${testCase['roman']}', () {
        expect(converter['instance'].toRoman(testCase['decimal']),
            equals(testCase['roman']));
      });
    });
  });

  group('fromRoman', () {
    converter['testCases'].forEach((Map<String, dynamic> testCase) {
      test('${testCase['roman']} -> ${testCase['decimal']}', () {
        expect(converter['instance'].fromRoman(testCase['roman']),
            equals(testCase['decimal']));
      });
    });
  });
}

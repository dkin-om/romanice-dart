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
  if (converter['toRoman'] != null) {
    converter['fromRoman'] = converter['toRoman'].inverse();
  } else if (converter['fromRoman'] != null) {
    converter['toRoman'] = converter['fromRoman'].inverse();
  }

  group('ToRoman', () {
    converter['testCases'].forEach((Map<String, dynamic> testCase) {
      test('${testCase['decimal']} -> ${testCase['roman']}', () {
        expect(converter['toRoman'](testCase['decimal']),
            equals(testCase['roman']));
      });
    });
  });

  group('FromRoman', () {
    converter['testCases'].forEach((Map<String, dynamic> testCase) {
      test('${testCase['roman']} -> ${testCase['decimal']}', () {
        expect(converter['fromRoman'](testCase['roman']),
            equals(testCase['decimal']));
      });
    });
  });
}

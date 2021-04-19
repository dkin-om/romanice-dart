import 'package:invertible/invertible.dart';
import 'package:romanice/romanice.dart';
import 'package:test/test.dart';

import 'custom_converter_testcase.dart';
import 'standard_converter_testcase.dart';
import 'unicode_converter_testcase.dart';

void main() {
  validationTests();
  domainErrorTests();

  testConverter(standardConverter);
  testConverter(unicodeConverter);
  testConverter(dkinomConverter);
}

void validationTests() {
  group('symbols have no elements', () {
    test('ToRoman', () {
      expect(
        () => ToRoman(<String>[]),
        throwsA(allOf(
          isArgumentError,
          predicate(
            (ArgumentError e) => e.name == 'symbols',
            'argument is symbols',
          ),
        )),
      );
    });

    test('FromRoman', () {
      expect(
        () => FromRoman(<String>[]),
        throwsA(allOf(
          isArgumentError,
          predicate(
            (ArgumentError e) => e.name == 'symbols',
            'argument is symbols',
          ),
        )),
      );
    });
  });

  group('symbols have duplicate elements', () {
    test('ToRoman', () {
      expect(
        () => ToRoman(<String>['I', 'V', 'I', 'L']),
        throwsA(allOf(
          isArgumentError,
          predicate(
            (ArgumentError e) => e.name == 'symbols',
            'argument is symbols',
          ),
        )),
      );
    });

    test('FromRoman', () {
      expect(
        () => FromRoman(<String>['I', 'V', 'X', 'V']),
        throwsA(allOf(
          isArgumentError,
          predicate(
            (ArgumentError e) => e.name == 'symbols',
            'argument is symbols',
          ),
        )),
      );
    });
  });

  group('symbols have elements with more than one unicode code point', () {
    test('ToRoman', () {
      expect(
        () => ToRoman(<String>['D', 'K', 'I', 'N', 'OM']),
        throwsA(allOf(
          isArgumentError,
          predicate(
            (ArgumentError e) => e.name == 'symbols',
            'argument is symbols',
          ),
        )),
      );
    });

    test('FromRoman', () {
      expect(
        () => FromRoman(<String>['D', 'K', 'I', 'N', '0️⃣', 'M']),
        throwsA(allOf(
          isArgumentError,
          predicate(
            (ArgumentError e) => e.name == 'symbols',
            'argument is symbols',
          ),
        )),
      );
    });
  });
}

void domainErrorTests() {
  group('ToRoman DomainErrors', () {
    test('x < 0', () {
      final ToRoman f = ToRoman.standard();
      expect(() => f(-1), throwsA(TypeMatcher<NotInDomainError>()));
    });

    test('x > biggestRepresentableNumber', () {
      final ToRoman f = ToRoman.unicode();
      expect(() => f(40000), throwsA(TypeMatcher<NotInDomainError>()));
    });
  });

  test('FromRoman DomainErrors', () {
    final FromRoman f = FromRoman.standard();

    final List<String> numeralsNotInDomain = <String>[
      'IVX',
      'VV',
      'VVV',
      'VIIII',
      'IL',
      'XD',
      'VL',
      'IIX',
    ];

    numeralsNotInDomain.forEach((String n) => expect(
        () => '$n is ${f(n)}', throwsA(TypeMatcher<NotInDomainError>())));
  });
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

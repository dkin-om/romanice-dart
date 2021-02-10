import 'package:romanice/romanice.dart';

final Map<String, dynamic> unicodeConverter = <String, dynamic>{
  'instance': Romanice.unicode(),
  'testCases': <Map<String, dynamic>>[
    <String, dynamic>{'decimal': 0, 'roman': ''},
    <String, dynamic>{'decimal': 1, 'roman': 'Ⅰ'},
    <String, dynamic>{'decimal': 2, 'roman': 'ⅠⅠ'},
    <String, dynamic>{'decimal': 3, 'roman': 'ⅠⅠⅠ'},
    <String, dynamic>{'decimal': 4, 'roman': 'ⅠⅤ'},
    <String, dynamic>{'decimal': 5, 'roman': 'Ⅴ'},
    <String, dynamic>{'decimal': 6, 'roman': 'ⅤⅠ'},
    <String, dynamic>{'decimal': 7, 'roman': 'ⅤⅠⅠ'},
    <String, dynamic>{'decimal': 8, 'roman': 'ⅤⅠⅠⅠ'},
    <String, dynamic>{'decimal': 9, 'roman': 'ⅠⅩ'},
    <String, dynamic>{'decimal': 10, 'roman': 'Ⅹ'},
    <String, dynamic>{'decimal': 11, 'roman': 'ⅩⅠ'},
    <String, dynamic>{'decimal': 12, 'roman': 'ⅩⅠⅠ'},
    <String, dynamic>{'decimal': 2020, 'roman': 'ↀↀⅩⅩ'},
    <String, dynamic>{'decimal': 2421, 'roman': 'ↀↀⅭⅮⅩⅩⅠ'},
    <String, dynamic>{'decimal': 3888, 'roman': 'ↀↀↀⅮⅭⅭⅭⅬⅩⅩⅩⅤⅠⅠⅠ'},
    <String, dynamic>{'decimal': 3999, 'roman': 'ↀↀↀⅭↀⅩⅭⅠⅩ'},
    <String, dynamic>{'decimal': 4000, 'roman': 'ↀↁ'},
    <String, dynamic>{'decimal': 38888, 'roman': 'ↂↂↂↁↀↀↀⅮⅭⅭⅭⅬⅩⅩⅩⅤⅠⅠⅠ'},
    <String, dynamic>{'decimal': 39999, 'roman': 'ↂↂↂↀↂⅭↀⅩⅭⅠⅩ'},
  ],
};

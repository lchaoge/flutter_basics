import 'package:intl/intl.dart';

// 使用dart生成arb文件
// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/demo/i18n/intl/ lib/demo/i18n/intl/cg_localizations.dart

// flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=cg_demo_ --output-dir=lib/demo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/cg_localizations.dart lib/demo/i18n/intl/intl_*.arb
class CGLocalizations {
  String get title => Intl.message(
    'hello',
    name:'title',
    desc: 'demo localizations.'
  );
  String greet(String name) => Intl.message(
    'hello $name',
    name: 'greet',
    desc: 'greet someone.',
    args: [name],
  );
}
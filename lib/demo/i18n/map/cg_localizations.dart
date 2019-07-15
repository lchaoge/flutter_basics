import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class CGLocalizations {
  final Locale locale;

  CGLocalizations(this.locale);
  
  static CGLocalizations of(BuildContext context){
    return Localizations.of<CGLocalizations>(context, CGLocalizations);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {'title': 'hello'},
    'zh': {'title': '您好'}
  };
  
  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class CGLocalizationsDelegate extends LocalizationsDelegate<CGLocalizations> {
  CGLocalizationsDelegate();
  @override
  Future<CGLocalizations> load(Locale locale) {
    return SynchronousFuture<CGLocalizations>(CGLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<CGLocalizations> old) {
    return false;
  }
}

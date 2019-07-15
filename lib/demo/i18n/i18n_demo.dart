import 'package:flutter/material.dart';
import 'package:flutter_basics/demo/i18n/map/cg_localizations.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${locale.languageCode}'),
            Text(locale.toString()),
            Text(
              CGLocalizations.of(context).title,
              style: Theme.of(context).textTheme.title,
            )
          ],
        ),
      )
    );
  }
}
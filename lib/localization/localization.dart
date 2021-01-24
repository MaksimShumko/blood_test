import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class L {
  final Locale locale;

  L(this.locale);

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L);
  }

  static const LocalizationsDelegate<L> delegate = _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;
  Map<String, String> _defaultLocalizedStrings;

  Future loadAll() async {
    _localizedStrings = await load(locale.languageCode);
    _defaultLocalizedStrings = await load('en');
  }

  Future<Map<String, String>> load(String languageCode) async {
    String jsonString = await rootBundle.loadString('i18n/$languageCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String t(String key) {
    return _localizedStrings[key] ?? _defaultLocalizedStrings[key];
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<L> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'pl', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<L> load(Locale locale) async {
    L localizations = L(locale);
    await localizations.loadAll();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

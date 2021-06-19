import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppLocalizations {
  late final Locale locale;
  late Map<String, String> _localizedValues;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get langCode =>
      '${locale.languageCode.toLowerCase()}_${locale.countryCode!.toLowerCase()}';

  Future<void> load() async {
    String _lang =
        '${locale.languageCode.toLowerCase()}_${locale.countryCode!.toLowerCase()}';
    print('Current Language: $_lang');
    String jsonString = await _localAssetFile('assets/languages/$_lang.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedValues =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  Future<String> _localAssetFile(String assetPath) async {
    return await rootBundle.loadString(assetPath);
  }

  Map<String, String> get lang => _localizedValues;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) => ['zh', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

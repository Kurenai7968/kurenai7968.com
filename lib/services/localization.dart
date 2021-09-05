import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

extension TranslationHelperStateless on StatelessWidget {
  String tr(BuildContext context, String key) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!
        .lang[key]!;
  }
}

extension TranslationHelperStateful<T extends StatefulWidget> on State<T> {
  String tr(BuildContext context, String key) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!
        .lang[key]!;
  }
}

class AppLocalizations {
  late final Locale locale;
  late Map<String, String> _localizedValues;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  Future<void> load() async {
    log('Current Language: $langCode');
    String jsonString =
        await _localAssetFile('assets/languages/$langCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedValues =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  Future<String> _localAssetFile(String assetPath) async {
    return await rootBundle.loadString(assetPath);
  }

  String get langCode =>
      '${locale.languageCode.toLowerCase()}_${locale.countryCode!.toLowerCase()}';

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

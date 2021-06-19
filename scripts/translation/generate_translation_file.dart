import 'dart:convert';
import 'dart:io';

import 'package:excel/excel.dart';

void main() {
  String languagePath = 'assets/languages/';
  String excelPath = "scripts/translation/translation.xlsx";
  File excelFile = File(excelPath);
  Excel excel = Excel.decodeBytes(excelFile.readAsBytesSync());
  Map<String, Language> languages = Map();

  for (var table in excel.tables.keys) {
    for (var row in excel.tables[table]!.rows) {
      // json key
      String? key = row[0]?.value.toString();
      for (var column in row) {
        String? cellId = column?.cellIndex.cellId;

        if (cellId != null && cellId != 'A1') {
          String columnCode = cellId.substring(0, 1);

          if (cellId.contains('1') && cellId.length == 2) {
            // first row, add all language object
            languages[columnCode] =
                Language(locale: column!.value, dirPath: languagePath);
          } else {
            // add translation to Map
            languages[columnCode]?.lang[key!] = column!.value;
          }
        }
      }
    }
  }

  languages.forEach((key, lang) => lang.generateLanguageFile());
}

class Language {
  late final String locale;
  late final String dirPath;
  Map<String, dynamic> lang = Map();

  Language({required String locale, required String dirPath}) {
    this.locale = locale;
    this.dirPath = dirPath;
  }

  void generateLanguageFile() {
    File langFile = File('$dirPath/$locale.json');
    String json = jsonEncode(lang);
    langFile.writeAsStringSync(json);
  }
}

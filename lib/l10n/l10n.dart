import 'package:flutter/material.dart';

class L10n {
  static final supportedLocales = [
    const Locale('de'),
    const Locale('en'),
  ];

  static String getLanguageByLocale(String localeString) {
    switch (localeString) {
      case 'de':
        return 'Deutsch';
      case 'en':
        return 'English';
      default:
        return 'undefined';
    }
  }
}

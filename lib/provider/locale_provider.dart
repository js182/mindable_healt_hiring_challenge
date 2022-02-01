import 'package:flutter/material.dart';
import 'package:mindable_healt_hiring_challenge/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  setLocale(Locale locale) {
    if (L10n.supportedLocales.contains(locale)) {
      _locale = locale;
      notifyListeners();
    }
  }

  resetLocale() {
    _locale = null;
    notifyListeners();
  }
}

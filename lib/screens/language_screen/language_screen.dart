import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mindable_healt_hiring_challenge/l10n/l10n.dart';
import 'package:mindable_healt_hiring_challenge/provider/locale_provider.dart';
import 'package:mindable_healt_hiring_challenge/screens/language_screen/components/list_tile_component.dart';
import 'package:mindable_healt_hiring_challenge/style/app_colors.dart';
import 'package:mindable_healt_hiring_challenge/style/styles.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).language),
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: Consumer<LocaleProvider>(
        builder: (_, localeProvider, __) => ListView.builder(
          itemCount: L10n.supportedLocales.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ListTileComponent(
                selected: localeProvider.locale == null,
                languageName: AppLocalizations.of(context).systemStandard(Platform.localeName),
                onTap: localeProvider.resetLocale,
              );
            }
            return ListTileComponent(
              selected: localeProvider.locale == L10n.supportedLocales[index - 1],
              languageName: L10n.getLanguageByLocale(L10n.supportedLocales[index - 1].languageCode),
              onTap: () => localeProvider.setLocale(L10n.supportedLocales[index - 1]),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mindable_healt_hiring_challenge/provider/locale_provider.dart';
import 'package:mindable_healt_hiring_challenge/screens/profile_screen/profile_screen.dart';
import 'package:mindable_healt_hiring_challenge/style/styles.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  final String appTitle = 'mindable_profil';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      child: Consumer<LocaleProvider>(
        builder: (_, localeProvider, __) => MaterialApp(
          title: appTitle,
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            fontFamily: TextStyles.defaultFontFamily,
          ),
          debugShowCheckedModeBanner: false,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: localeProvider.locale,
          home: const ProfileScreen(),
        ),
      ),
    );
  }
}

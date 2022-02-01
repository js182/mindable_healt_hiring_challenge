import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mindable_healt_hiring_challenge/screens/language_screen/language_screen.dart';
import 'package:mindable_healt_hiring_challenge/screens/profile_screen/components/components.dart';
import 'package:mindable_healt_hiring_challenge/style/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userEmail;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //titel
              const SizedBox(height: StyleConstants.spacer48),
              Center(
                child: Text(
                  AppLocalizations.of(context).profile,
                ),
              ),

              //avatar + name
              const SizedBox(height: StyleConstants.spacer32),
              const ProfileHeaderComponent(),

              //email + sprache
              const SizedBox(height: StyleConstants.spacer32),
              const Divider(height: StyleConstants.dividerHeight),
              GestureDetector(
                onTap: () => _onEmailTap(context),
                child: HorizontalDetailComponent(
                  iconData: Icons.email_outlined,
                  keyString: AppLocalizations.of(context).email,
                  valueString: userEmail ?? AppLocalizations.of(context).mockUserEmail,
                  showArrow: false,
                ),
              ),
              const Divider(
                indent: StyleConstants.padding16,
                height: StyleConstants.dividerHeight,
              ),
              HorizontalDetailComponent(
                iconData: Icons.chat_rounded,
                keyString: AppLocalizations.of(context).language,
                valueString: AppLocalizations.of(context).currentLanguage,
                onTap: () => _onLanguageTap(context),
              ),

              //informationen
              const SizedBox(height: StyleConstants.spacer24),
              Padding(
                padding: const EdgeInsets.only(left: StyleConstants.padding16),
                child: Text(
                  AppLocalizations.of(context).details,
                ),
              ),
              const Divider(height: StyleConstants.dividerHeight),
              HorizontalDetailComponent(
                iconData: Icons.copy,
                keyColor: AppColors.black,
                keyString: AppLocalizations.of(context).agb,
                onTap: _onAGBsTap,
              ),
              const Divider(
                indent: StyleConstants.padding16,
                height: StyleConstants.dividerHeight,
              ),
              HorizontalDetailComponent(
                iconData: Icons.lock_outline_rounded,
                keyColor: AppColors.black,
                keyString: AppLocalizations.of(context).dataPrivacy,
                onTap: _onDataprivacyTap,
              ),

              //bewertung
              const SizedBox(height: StyleConstants.spacer24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: StyleConstants.padding16),
                child: TextButton(
                  onPressed: _onRateTap,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(StyleConstants.padding12),
                    backgroundColor: AppColors.buttonBackgroundLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context).rateMindable,
                  ),
                ),
              ),

              //ausloggen
              const SizedBox(height: StyleConstants.spacer24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: StyleConstants.padding16),
                child: ElevatedButton(
                  onPressed: _onLogoutTap,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(StyleConstants.padding12),
                    primary: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    AppLocalizations.of(context).logout,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onEmailTap(BuildContext context) async {
    String? newEmail = await _openEmailChangeMenu(context, userEmail ?? AppLocalizations.of(context).mockUserEmail);
    if (newEmail != null && newEmail.isNotEmpty) {
      setState(() {
        userEmail = newEmail;
      });
    }
  }

  _onLanguageTap(BuildContext context) {
    _openLanguageScreen(context);
  }

  _onAGBsTap() {}

  _onDataprivacyTap() {}

  _onRateTap() {}

  _onLogoutTap() {}

  _openLanguageScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LanguageScreen()));
  }

  Future<String?> _openEmailChangeMenu(BuildContext context, String currentEmail) {
    TextEditingController _textEditingController = TextEditingController(text: currentEmail);
    return showModalBottomSheet(
      backgroundColor: AppColors.background,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(StyleConstants.modalBottomSheetBorderRadius),
        ),
      ),
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(StyleConstants.modalBottomSheetBorderRadius),
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                '${AppLocalizations.of(context).email}:',
                style: TextStyles.overlineTextStyle.copyWith(color: AppColors.fontKeyString),
              ),
              const SizedBox(height: StyleConstants.spacer8),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).mockUserEmail,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
                style: TextStyles.overlineTextStyle.copyWith(color: AppColors.fontKeyString),
                controller: _textEditingController,
              ),
              const SizedBox(height: StyleConstants.spacer8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(StyleConstants.padding12),
                      backgroundColor: AppColors.buttonBackgroundLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context).cancel,
                    ),
                  ),
                  const SizedBox(width: StyleConstants.spacer8),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(_textEditingController.text),
                    child: Text(
                      AppLocalizations.of(context).submit,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(StyleConstants.padding12),
                      primary: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius),
                      ),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).then((value) {
      return value;
    });
  }
}

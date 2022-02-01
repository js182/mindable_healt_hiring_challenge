import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mindable_healt_hiring_challenge/style/styles.dart';

class ProfileHeaderComponent extends StatelessWidget {
  const ProfileHeaderComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: StyleConstants.padding16),
      child: Row(
        children: [
          Container(
            width: StyleConstants.avatarSize,
            height: StyleConstants.avatarSize,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.avatarBorder,
                width: StyleConstants.avatarBorderWidth,
              ),
              shape: BoxShape.circle,
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/03.png'),
              ),
            ),
          ),
          const SizedBox(width: StyleConstants.spacer24),
          Column(
            children: [
              Text(
                AppLocalizations.of(context).mockUserName,
                style: TextStyles.headline2TextStyle.copyWith(color: AppColors.fontKeyString),
              ),
              Text(
                AppLocalizations.of(context).female,
                style: TextStyles.descriptionTextTextStyle.copyWith(color: AppColors.fontValueString),
              ),
            ],
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.arrow_forward_ios,
            size: StyleConstants.headerArrowRightSize,
            color: AppColors.arrowRight,
          ),
        ],
      ),
    );
  }
}

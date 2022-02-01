import 'package:flutter/material.dart';
import 'package:mindable_healt_hiring_challenge/style/styles.dart';

class HorizontalDetailComponent extends StatelessWidget {
  const HorizontalDetailComponent({
    Key? key,
    required this.iconData,
    required this.keyString,
    this.keyColor,
    this.valueString = '',
    this.showArrow = true,
    this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String keyString;
  final Color? keyColor;
  final String valueString;
  final bool showArrow;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(StyleConstants.padding14),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: AppColors.primaryColor,
            size: StyleConstants.horizontalDetailIconSize,
          ),
          const SizedBox(width: StyleConstants.padding16),
          Text(keyString, style: TextStyles.detailTextStyle.copyWith(color: keyColor ?? AppColors.fontKeyString)),
          Expanded(
            child: Text(
              valueString,
              style: TextStyles.detailTextStyle.copyWith(color: AppColors.fontValueString),
              textAlign: TextAlign.right,
            ),
          ),
          if (showArrow) const SizedBox(width: StyleConstants.padding12),
          if (showArrow)
            GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_forward_ios,
                size: StyleConstants.horizontalDetailIconSize,
                color: AppColors.arrowRight,
              ),
            ),
        ],
      ),
    );
  }
}

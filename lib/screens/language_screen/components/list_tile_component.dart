import 'package:flutter/material.dart';
import 'package:mindable_healt_hiring_challenge/style/styles.dart';

class ListTileComponent extends StatelessWidget {
  const ListTileComponent({
    Key? key,
    required this.selected,
    required this.languageName,
    required this.onTap,
  }) : super(key: key);

  final bool selected;
  final String languageName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: selected ? const Icon(Icons.check, color: AppColors.primaryColor) : const SizedBox(width: 0.0),
      title: Text(
        languageName,
        style: TextStyles.detailTextStyle.copyWith(
          color: selected ? AppColors.primaryColor : AppColors.fontKeyString,
          fontWeight: selected ? FontWeight.w700 : FontWeight.normal,
        ),
      ),
      selected: selected,
    );
  }
}

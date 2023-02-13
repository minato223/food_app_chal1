// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/widgets/app_button.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class BottomActionSheet extends StatelessWidget {
  String? title;
  String? subtitle;
  String? buttonTitle;
  Function()? onClick;
  BottomActionSheet(
      {super.key, this.title, this.subtitle, this.buttonTitle, this.onClick});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Container(
      padding: EdgeInsets.all(size.CONTENT_SPACE),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ?? 'Total Order',
                  style: theme.textTheme.titleSmall!.copyWith(
                      color: AppColors.textColor, fontWeight: FontWeight.w900)),
              XSpace(size.CONTENT_SPACE / 2).y,
              Text(subtitle ?? '\$37.32',
                  style: theme.textTheme.titleMedium!.copyWith(
                      color: AppColors.greenColor, fontWeight: FontWeight.w900))
            ],
          ),
          XSpace(size.CONTENT_SPACE * 2).x,
          Expanded(
              child: AppButton(
            text: buttonTitle ?? "Add to cart",
            onTap: onClick,
          ))
        ],
      ),
    );
  }
}

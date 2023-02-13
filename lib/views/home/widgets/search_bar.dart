import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Container(
      margin: EdgeInsets.all(size.CONTENT_SPACE),
      padding: EdgeInsets.symmetric(
          horizontal: size.CONTENT_SPACE * .8,
          vertical: size.CONTENT_SPACE * .2),
      decoration: BoxDecoration(
          color: AppColors.searchBackground,
          borderRadius: BorderRadius.circular(30)),
      child: Row(children: [
        SvgPicture.asset(
          AppIcons.search,
          color: AppColors.textColor,
        ),
        XSpace(size.CONTENT_SPACE).x,
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "Search your food ...",
                border: InputBorder.none,
                hintStyle: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.textColor)),
          ),
        )
      ]),
    );
  }
}

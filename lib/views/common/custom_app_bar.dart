// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class CustomAppBar extends StatelessWidget {
  Widget? leading;
  String? title;
  Widget? actions;
  CustomAppBar({super.key, this.actions, this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE),
          height: kToolbarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              leading ?? XSpace(0).x,
              XSpace(size.CONTENT_SPACE * .7).x,
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(bottom: size.CONTENT_SPACE * .3),
                child: title != null
                    ? Text(title!,
                        style: theme.textTheme.titleLarge!
                            .copyWith(fontWeight: FontWeight.w900))
                    : null,
              )),
              actions ?? XSpace(0).x
            ],
          ),
        ),
        XSpace(size.CONTENT_SPACE).y
      ],
    );
  }
}

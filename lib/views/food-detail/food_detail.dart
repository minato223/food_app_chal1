import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_images.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/widgets/app_button.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.HEIGHT * .4,
            width: size.WIDTH,
            padding: EdgeInsets.all(size.CONTENT_SPACE),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.food2), fit: BoxFit.cover)),
            child: Stack(children: [
              Align(
                alignment: const Alignment(-1, -.8),
                child: roundedIconButton(
                    child: SvgPicture.asset(
                  AppIcons.arrowLeft,
                  color: Colors.white,
                )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      width: size.CONTENT_SPACE * 2.5,
                      height: 4,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.CONTENT_SPACE * .3),
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(2),
                          color: index == 0 ? Colors.white : Colors.white38),
                    );
                  }),
                ),
              )
            ]),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(size.CONTENT_SPACE),
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Spicy chicken Teriyaki',
                            style: theme.textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.w900)),
                        XSpace(size.CONTENT_SPACE * .8).y,
                        Text('\$37.32',
                            style: theme.textTheme.titleMedium!.copyWith(
                                color: AppColors.greenColor,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                  ),
                  roundedIconButton(
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      borderColor: Colors.black26,
                      ratio: size.CONTENT_SPACE * 2.9)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
                child: DottedLine(
                  dashColor: AppColors.textColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Additional menu',
                      style: theme.textTheme.titleSmall!
                          .copyWith(fontWeight: FontWeight.w900)),
                  XSpace(size.CONTENT_SPACE * .5).y,
                  Text('Optional, can choose more than one',
                      style: theme.textTheme.titleSmall!.copyWith(
                          color: Colors.black38, fontWeight: FontWeight.w800))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
                child: Column(
                  children: List.generate(3, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('French fries',
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: Colors.black54,
                                fontWeight: FontWeight.w900)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('\$3.55',
                                style: theme.textTheme.titleSmall!.copyWith(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w900)),
                            // XSpace(size.CONTENT_SPACE / 2).x,
                            Checkbox(
                              activeColor: AppColors.greenColor,
                              value: index == 0,
                              onChanged: (t) {},
                            ),
                          ],
                        )
                      ],
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.CONTENT_SPACE),
                child: DottedLine(
                  dashColor: AppColors.textColor,
                ),
              ),
              Text('Note to seller',
                  style: theme.textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w900)),
              Container(
                padding: EdgeInsets.all(size.CONTENT_SPACE),
                margin: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                    'Fugiat nostrud voluptate consectetur velit amet ullamco pariatur qui duis ullamco magna elit.',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: AppColors.textColor, height: 2)),
              )
            ],
          )),
          SizedBox(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(size.CONTENT_SPACE),
                  color: Colors.blueGrey[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Order Quantity',
                          style: theme.textTheme.titleSmall!
                              .copyWith(fontWeight: FontWeight.w900)),
                      Row(
                        children: [
                          roundedIconButton(
                              child: Icon(
                                Icons.remove_rounded,
                                color: AppColors.greenColor,
                              ),
                              borderColor: AppColors.greenColor,
                              ratio: size.CONTENT_SPACE * 1.9),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.CONTENT_SPACE / 2),
                            child: Text('1',
                                style: theme.textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w900)),
                          ),
                          roundedIconButton(
                              child: Icon(
                                Icons.add_rounded,
                                color: AppColors.greenColor,
                              ),
                              borderColor: AppColors.greenColor,
                              ratio: size.CONTENT_SPACE * 1.9)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(size.CONTENT_SPACE),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Order',
                              style: theme.textTheme.titleSmall!.copyWith(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w900)),
                          XSpace(size.CONTENT_SPACE / 2).y,
                          Text('\$37.32',
                              style: theme.textTheme.titleMedium!.copyWith(
                                  color: AppColors.greenColor,
                                  fontWeight: FontWeight.w900))
                        ],
                      ),
                      XSpace(size.CONTENT_SPACE * 2).x,
                      Expanded(
                          child: AppButton(
                        text: "Add to cart",
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget roundedIconButton(
      {required Widget child, Color? borderColor, double? ratio}) {
    return Builder(builder: (context) {
      AppSizes size = AppSizes(context);
      double r = ratio ?? size.CONTENT_SPACE * 2.5;
      return Container(
        height: r,
        width: r,
        padding: EdgeInsets.all(size.CONTENT_SPACE / 2),
        decoration: BoxDecoration(
            color: Colors.white24,
            border: Border.all(color: borderColor ?? Colors.white, width: 1.5),
            shape: BoxShape.circle),
        child: FittedBox(child: child),
      );
    });
  }
}

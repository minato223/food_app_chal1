// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_images.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/widgets/app_grid_view.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    List<String> categories = [
      "🍠 Steak",
      "🥕 Vegetables",
      "🍕 Fast food",
      "🥚 Eggs"
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          toolbarHeight: kToolbarHeight * 1.5,
          title: SizedBox(
              height: kToolbarHeight,
              width: size.WIDTH * .65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Your location",
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: AppColors.textColor),
                  ),
                  Text(
                    "Minato Namikaze, Konohagakure",
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              )),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: size.CONTENT_SPACE),
              child: CircleAvatar(
                backgroundImage: AssetImage(AppImages.avatar),
                radius: 25,
              ),
            )
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
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
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor)),
                  ),
                )
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.CONTENT_SPACE / 2,
                  horizontal: size.CONTENT_SPACE),
              height: size.WIDTH * .4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.food2), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            stops: [
                              .3,
                              .5,
                              .7
                            ],
                            colors: [
                              Color.fromARGB(233, 0, 0, 0),
                              Color.fromARGB(188, 0, 0, 0),
                              Colors.transparent
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: size.WIDTH * .7,
                    padding: EdgeInsets.all(size.CONTENT_SPACE),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: FittedBox(
                            child: Text(
                              "Good price for\nyour breakfast !".toUpperCase(),
                              style: theme.textTheme.headline5!.copyWith(
                                  height: 1.4,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                              style: theme.textTheme.titleMedium,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Discount up to',
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(color: AppColors.textColor)),
                                TextSpan(
                                    text: ' 50%',
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        XSpace(size.CONTENT_SPACE / 2).y
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, .9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        double ratio = 8;
                        bool active = index == 0;

                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: ratio / 3),
                          height: ratio,
                          width: ratio * (active ? 3 : 1),
                          decoration: BoxDecoration(
                              color: active
                                  ? Colors.white
                                  : const Color.fromARGB(167, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.WIDTH * .15,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE),
                children: categories.map((e) {
                  return Container(
                      margin: EdgeInsets.only(left: size.CONTENT_SPACE / 2),
                      child: Chip(
                          padding: EdgeInsets.all(size.CONTENT_SPACE / 1.5),
                          label: Text(e,
                              style: theme.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold))));
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.CONTENT_SPACE),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Recommended",
                      style: theme.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w900)),
                  Text("View all",
                      style: theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.greenColor))
                ],
              ),
            ),
            XSpace(size.CONTENT_SPACE / 2).y,
            AppGridView(
                crossAxisCount: 2,
                crossAxisSpacing: size.CONTENT_SPACE,
                mainAxisSpacing: size.CONTENT_SPACE * 1.5,
                padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE),
                children: List.generate(
                    5,
                    (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.WIDTH * .5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(AppImages.food3))),
                            ),
                            Padding(
                              padding: EdgeInsets.all(size.CONTENT_SPACE * .6),
                              child: Text("Spicy chicken Toriyaki",
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleSmall!.copyWith(
                                      fontWeight: FontWeight.w900,
                                      height: 1.5)),
                            )
                          ],
                        ))),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_images.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/widgets/app_button.dart';
import 'package:food_app_chal1/widgets/app_icon.dart';
import 'package:food_app_chal1/widgets/outlined_icon_button.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class MerchantDetail extends StatelessWidget {
  const MerchantDetail({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    Map<String, String> cardBody = {
      "Rating": "⭐ 4.6",
      "Ditance": "1.5 Km",
      "Time": "🕒 5min",
      "Sold": "325 Sold"
    };
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE),
                  height: kToolbarHeight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OutlinedIconButton(
                          borderColor: AppColors.textColor,
                          child: SvgPicture.asset(
                            AppIcons.arrowLeft,
                            color: Colors.black54,
                          )),
                      XSpace(size.CONTENT_SPACE * .7).x,
                      Expanded(
                          child: Padding(
                        padding:
                            EdgeInsets.only(bottom: size.CONTENT_SPACE * .3),
                        child: Text('Detail Merchant',
                            style: theme.textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.w900)),
                      )),
                      OutlinedIconButton(
                          borderColor: AppColors.textColor,
                          child: SvgPicture.asset(
                            AppIcons.search,
                            color: Colors.black54,
                          )),
                      XSpace(size.CONTENT_SPACE / 2).x,
                      OutlinedIconButton(
                          borderColor: AppColors.textColor,
                          child: SvgPicture.asset(
                            AppIcons.share,
                            color: Colors.black54,
                          ))
                    ],
                  ),
                ),
                XSpace(size.CONTENT_SPACE).y
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(size.CONTENT_SPACE),
                physics: const BouncingScrollPhysics(),
                children: [
                  XSpace(size.CONTENT_SPACE / 2).y,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.scaffoldBackgroundColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(5, 5),
                            blurRadius: 10,
                            spreadRadius: 1,
                          )
                        ]),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(size.CONTENT_SPACE * .5),
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  AppImages.food6,
                                  width: size.WIDTH * .15,
                                  height: size.WIDTH * .15,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              XSpace(size.CONTENT_SPACE).x,
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: size.CONTENT_SPACE * .3),
                                child: Text('Apolo chicken, Pak Sugar',
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(fontWeight: FontWeight.w800)),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.CONTENT_SPACE),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: cardBody.keys
                                .map((key) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(key,
                                            style: theme.textTheme.titleSmall!
                                                .copyWith(
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.blueGrey)),
                                        XSpace(size.CONTENT_SPACE * .8).y,
                                        Text(cardBody[key] ?? '',
                                            style: theme.textTheme.titleSmall!
                                                .copyWith(
                                              fontWeight: FontWeight.w800,
                                            ))
                                      ],
                                    ))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(size.CONTENT_SPACE),
                    margin: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
                    decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppIcon(
                          path: AppIcons.ticket,
                          color: Colors.white,
                          size: size.CONTENT_SPACE * 1.8,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.CONTENT_SPACE / 2),
                            child: Text("2 voucher available there",
                                style: theme.textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white)),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Our full menu",
                          style: theme.textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w900)),
                      Text("View all",
                          style: theme.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.greenColor))
                    ],
                  ),
                  XSpace(size.CONTENT_SPACE).y,
                  ...List.generate(5, (index) {
                    return Container(
                      padding: EdgeInsets.all(size.CONTENT_SPACE * .5),
                      margin: EdgeInsets.only(bottom: size.CONTENT_SPACE),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 1,
                            )
                          ]),
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Container(
                                  width: size.WIDTH * .2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(AppImages.food6),
                                          fit: BoxFit.cover)),
                                ),
                                XSpace(size.CONTENT_SPACE).x,
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.CONTENT_SPACE / 2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Spicy Chiken Teriyaki',
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w900)),
                                      XSpace(size.CONTENT_SPACE * .8).y,
                                      Text(
                                          'Spicy Chiken Teriyaki Proident magna ullamco laboris nisi.',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.titleSmall!
                                              .copyWith(
                                                  color: AppColors.textColor,
                                                  fontWeight: FontWeight.w800)),
                                      XSpace(size.CONTENT_SPACE * .8).y,
                                      Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style:
                                                  theme.textTheme.titleMedium,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: '\$9.12 ',
                                                    style: theme
                                                        .textTheme.titleSmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900)),
                                                TextSpan(
                                                    text: ' \$0.02',
                                                    style: theme
                                                        .textTheme.titleSmall!
                                                        .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            color: AppColors
                                                                .textColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    size.CONTENT_SPACE * .2),
                                            child: Text(
                                              "|",
                                              style: TextStyle(
                                                  color: AppColors.textColor),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: Text('Can be customized',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: theme
                                                      .textTheme.titleSmall!
                                                      .copyWith(
                                                          color: AppColors
                                                              .greenColor,
                                                          fontWeight: FontWeight
                                                              .w800))),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                          XSpace(size.CONTENT_SPACE).y,
                          AppButton(
                            text: "Add to cart",
                          )
                        ],
                      ),
                    );
                  }).toList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

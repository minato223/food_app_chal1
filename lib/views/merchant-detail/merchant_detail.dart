import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_images.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/fixtures/food_fixtures.dart';
import 'package:food_app_chal1/views/common/custom_app_bar.dart';
import 'package:food_app_chal1/views/merchant-detail/widgets/merchant_food_item.dart';
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
            CustomAppBar(
              leading: OutlinedIconButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderColor: AppColors.textColor,
                  child: SvgPicture.asset(
                    AppIcons.arrowLeft,
                    color: Colors.black54,
                  )),
              title: "Detail Merchant",
              actions: Row(
                children: [
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
                  ...FoodFixtures.foods
                      .map((e) => MerchantFoodItem(item: e))
                      .toList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

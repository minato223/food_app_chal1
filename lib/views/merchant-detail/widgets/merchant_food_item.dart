// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/models/food_model.dart';
import 'package:food_app_chal1/widgets/app_button.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class MerchantFoodItem extends StatelessWidget {
  FoodModel item;
  MerchantFoodItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: .4, end: 1),
        duration: const Duration(milliseconds: 600),
        builder: ((context, value, child) {
          return Opacity(
            opacity: value,
            child: Container(
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
                        SizedBox(
                            width: size.WIDTH * .2,
                            child: Transform.scale(
                                scale: value,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(item.image),
                                          fit: BoxFit.cover)),
                                ))),
                        XSpace(size.CONTENT_SPACE).x,
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.CONTENT_SPACE / 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  style: theme.textTheme.titleMedium!
                                      .copyWith(fontWeight: FontWeight.w900)),
                              XSpace(size.CONTENT_SPACE * .8).y,
                              Text(
                                  'Spicy Chiken Teriyaki Proident magna ullamco laboris nisi.',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleSmall!.copyWith(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w800)),
                              XSpace(size.CONTENT_SPACE * .8).y,
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: theme.textTheme.titleMedium,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '\$${item.price} ',
                                            style: theme.textTheme.titleSmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w900)),
                                        TextSpan(
                                            text: ' \$${item.promotionPrice}',
                                            style: theme.textTheme.titleSmall!
                                                .copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: AppColors.textColor,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.CONTENT_SPACE * .2),
                                    child: Text(
                                      "|",
                                      style:
                                          TextStyle(color: AppColors.textColor),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text('Can be customized',
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.titleSmall!
                                              .copyWith(
                                                  color: AppColors.greenColor,
                                                  fontWeight:
                                                      FontWeight.w800))),
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
            ),
          );
        }));
  }
}

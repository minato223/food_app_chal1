import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_images.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class Presentation extends StatelessWidget {
  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: size.CONTENT_SPACE / 2, horizontal: size.CONTENT_SPACE),
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
                gradient: const LinearGradient(stops: [
                  .3,
                  .5,
                  .7
                ], colors: [
                  Color.fromARGB(233, 0, 0, 0),
                  Color.fromARGB(188, 0, 0, 0),
                  Colors.transparent
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
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
                                .copyWith(color: Colors.white38)),
                        TextSpan(
                            text: ' 50%',
                            style: theme.textTheme.titleMedium!.copyWith(
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
    );
  }
}

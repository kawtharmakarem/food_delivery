import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text:text),
                  SizedBox(
                    height: Dimensions.height10, //todo old value 10
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: 15,
                                )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "4.5"),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "1287"),
                      const SizedBox(
                        width: 5,
                      ),
                      SmallText(text: "comments"),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height20, //todo old value 20
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColors.iconColor1),
                      IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7Km",
                          iconColor: AppColors.mainColor),
                      IconAndTextWidget(
                          icon: Icons.access_time_filled_rounded,
                          text: "32min",
                          iconColor: AppColors.iconColor2)
                    ],
                  )
                ],
              );
  }
}
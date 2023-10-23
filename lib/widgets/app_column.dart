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
                  BigText(text:text,size: Dimensions.font20,),
                  SizedBox(
                    height: Dimensions.height10, //todo old value 10
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: Dimensions.iconSize15,
                                )),
                      ),
                       SizedBox(
                        width: Dimensions.width10,
                      ),
                      SmallText(text: "4.5"),
                       SizedBox(
                        width: Dimensions.width10,
                      ),
                      SmallText(text: "1287"),
                       SizedBox(
                        width: Dimensions.width5,
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
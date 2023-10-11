import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/home/food_page_body.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("the current height is "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body:Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
              padding:  EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Bangladsh",color: AppColors.mainColor),
                      Row(
                        children: [
                          Row(
                            children: [
                              SmallText(text: "Narsigndi",color: Colors.black54,),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width:Dimensions.width45,
                      height: Dimensions.width45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor
                      ),
                      child: Icon(Icons.search,color: Colors.white,size:Dimensions.iconSize24,),
                    ),
                  )
                ],
              ),
            ),
          ),
       Expanded(child: SingleChildScrollView(child: FoodPageBody()))
        ],
      ), 
    );
  }
}
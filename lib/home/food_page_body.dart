import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/icon_and_text_widget.dart';
import 'package:fooddelivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue=0.0;

@override
  void initState() {
  super.initState();
  pageController.addListener(() { 
      setState(() {
        _currentPageValue=pageController.page!;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.redAccent,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/food01.jpg"))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side "),
                  const SizedBox(height: 10,),
                  Row(
                  children: [
                   Wrap(children: List.generate(5, (index) => const Icon(Icons.star,color: AppColors.mainColor,size: 15,)),),
                   const SizedBox(width: 10,),
                   SmallText(text: "4.5"),
                   const SizedBox(width: 10,),
                   SmallText(text: "1287"),
                   const SizedBox(width: 5,),
                   SmallText(text: "comments"),

                  ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      IconAndTextWidget(icon: Icons.circle_sharp, 
                      text: "Normal",
                       iconColor: AppColors.iconColor1),
                       IconAndTextWidget(icon:Icons.location_on, text: "1.7Km", iconColor: AppColors.mainColor),
                       IconAndTextWidget(icon: Icons.access_time_filled_rounded, text: "32min", iconColor: AppColors.iconColor2)
                    ],
                  )
                ],
              ),
            ),
            
          ),
        ),
      ],
    );
  }
}

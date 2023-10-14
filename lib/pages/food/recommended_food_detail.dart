import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/app_icon.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child: BigText(
                  text: "Chinese Side",
                  size: Dimensions.fonts26,
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))),
              ),
            ),
            backgroundColor: AppColors.yellowColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food02.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(
                    text:
                        "Chicken marinated in spiced yoghurt is placed in a laarge pot,Chicken marinated in spiced yoghurt is placed in a laarge pot,Chicken marinated in spiced yoghurt is placed in a laarge pot,Chicken marinated in spiced yoghurt is placed in a laarge pot,Chicken marinated in spiced yoghurt is placed in a laarge potChicken marinated in spiced yoghurt is placed in a laarge pot,Chicken marinated in spiced yoghurt is placed in a laarge pot,Chicken marinated in spiced yoghurt is placed in a laarge pot,Chicken marinated in spiced yoghurt is placed in a laarge pot,then layered with friend onions(cheeky easy sub below!),fresh coriander/cilantro,then parb boiled,then layered with friend onions(cheeky easy sub below!),fresh coriander/cilantro,then parb boiled Chicken marinated in spiced yoghurt is placed in a laarge pot,Chicken marinated in spiced yoghurt is placed in a laarge pot,then layered with friend onions(cheeky easy sub below!),Chicken marinated in spiced yoghurt is placed in a laarge pot,Chicken marinated in spiced yoghurt is placed in a laarge pot,then layered with friend onions(cheeky easy sub below!),fresh coriander/cilantro,then parb boiled,then layered with friend onions(cheeky easy sub below!),fresh coriander/cilantro,then parb boiled Chicken marinated in spiced yoghurt is placed in a laarge pot,Chicken marinated in spiced yoghurt is placed in a laarge pot,then layered with friend onions(cheeky easy sub below!),fresh coriander/cilantro,then parb boiled,then layered with friend onions(cheeky easy sub below!),fresh coriander/cilantro,then parb boiled ,fresh coriander/cilantro,then parb boiled,then layered with friend onions(cheeky easy sub below!),fresh coriander/cilantro,then parb boiled",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backGroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                  text: "\$12.88" + "X" + "0",
                  color: AppColors.mainColor,
                  size: Dimensions.font16,
                ),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backGroundColor: AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),
           Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height20,
            right: Dimensions.width20,
            left: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroudColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Icon(Icons.favorite,color: AppColors.mainColor,)
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor),
              child: BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
        ],
      ),
    );
  }
}

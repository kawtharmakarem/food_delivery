import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/cart_controller.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/controllers/recommended_product_controller.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';
import 'package:fooddelivery/routes/route_helper.dart';
import 'package:fooddelivery/utils/app_constants.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/widgets/app_icon.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backGroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backGroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backGroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            )),
        Positioned(
            top: Dimensions.height20 * 5.5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController){
                  var _cartList=cartController.getItems;
                  return ListView.builder(
                    itemCount: _cartList.length,
                    itemBuilder: (_, index) {
                      return Container(
                        height: Dimensions.height20 * 5,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                var popularIndex=Get.find<PopularProductController>().popularProductList.indexOf(_cartList[index].product);
                                if(popularIndex>=0){
                                Get.toNamed(RouteHelper.getPopularFood(popularIndex,"cartpage"));
                                }else{
                                  var recommendedIndex=Get.find<RecommendedProductController>().recommendedProductList.indexOf(_cartList[index].product!);
                                Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex,"cartpage"));
                                }
                              },
                              child: Container(
                                width: Dimensions.height20 * 5,
                                height: Dimensions.height20 * 5,
                                margin:
                                    EdgeInsets.only(bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!),
                                            ),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20)),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Expanded(
                                child: Container(
                              height: Dimensions.height20 * 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                    text: cartController.getItems[index].name!,
                                    color: Colors.black54,
                                  ),
                                  SmallText(text: "spicy"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                       text: "\$ ${cartController.getItems[index].price}",
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: Dimensions.height10,
                                            bottom: Dimensions.height10,
                                            left: Dimensions.width10,
                                            right: Dimensions.width10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                //popularProduct.setQuantity(false);
                                              cartController.addItem(_cartList[index].product!, -1);
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            BigText(
                                                text:
                                                    _cartList[index].quantity.toString()), //popularProduct.inCartItems.toString()
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                //popularProduct.setQuantity(true);
                                                cartController.addItem(_cartList[index].product!, 1);
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: AppColors.signColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      );
                    });
                },)
              ),
            ))
      ]),
    );
  }
}

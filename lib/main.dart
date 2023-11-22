import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/cart_controller.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/controllers/recommended_product_controller.dart';
import 'package:fooddelivery/pages/cart/cart_page.dart';
import 'package:fooddelivery/pages/home/food_page_body.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';
import 'package:fooddelivery/pages/splash/splash_page.dart';
import 'package:fooddelivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();

    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     
      // home: SplashScreen(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    );
      });
    });
  }
}


//http://mvs.bslmeiyu.com/api/v1/products/popular
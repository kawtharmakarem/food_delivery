import 'dart:convert';

import 'package:fooddelivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});
  List<String> cart=[];
  
  void addToCartList(List<CartModal> cartList){
    cart=[];
    cartList.forEach((element) { 
    return  cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

List<CartModal> getCartList(){
  List<String> carts=[];
List<CartModal> cartList=[];
if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
 carts= sharedPreferences.getStringList(AppConstants.CART_LIST)!;
 print("inside getCartList"+carts.toString());
}
carts.forEach((element) {
  cartList.add(CartModal.fromJson(jsonDecode(element)));
 });
return cartList;

}
}
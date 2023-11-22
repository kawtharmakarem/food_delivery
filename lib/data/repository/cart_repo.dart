import 'dart:convert';

import 'package:fooddelivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  List<String> cart=[];
  List<String> cartHistory=[];
  
  void addToCartList(List<CartModal> cartList){
    //sharedPreferences.remove(AppConstants.CART_LIST);
    //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    var time=DateTime.now().toString();
    cart=[];
    cartList.forEach((element) { 
      element.time=time;
    return  cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    //getCartList();
  }

List<CartModal> getCartList(){
  List<String> carts=[];
List<CartModal> cartList=[];
if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
 carts= sharedPreferences.getStringList(AppConstants.CART_LIST)!;
}
carts.forEach((element) {
  cartList.add(CartModal.fromJson(jsonDecode(element)));
 });
return cartList;

}

List<CartModal> getCartHistoryList(){
  if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
    cartHistory=[];
    cartHistory=sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
  }
   List<CartModal> cartListHistory=[];
   cartHistory.forEach((element) =>cartListHistory.add(CartModal.fromJson(jsonDecode(element))));
    return cartListHistory;
}

void addToCartHistoryList(){
  if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
    cartHistory=sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
  }
for(int i=0;i<cart.length;i++){
   cartHistory.add(cart[i]);
}
removeCart();
sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
print("the length of history list"+getCartHistoryList().length.toString());
for(int j=0;j<getCartHistoryList().length;j++){
  print("The time for this order"+getCartHistoryList()[j].time.toString());
}
}

void removeCart(){
  cart=[];
    sharedPreferences.remove(AppConstants.CART_LIST);

}

}
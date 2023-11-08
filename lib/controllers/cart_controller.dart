import 'package:flutter/material.dart';
import 'package:fooddelivery/data/repository/cart_repo.dart';
import 'package:fooddelivery/models/cart_model.dart';
import 'package:fooddelivery/models/product_model.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModal> _items = {};
  Map<int,CartModal> get items=>_items;

  void addItem(ProductModal product, int quantity) {
   if(_items.containsKey(product.id))
   {
    _items.update(product.id!, (value){
      return CartModal(
        id: value.id,
        name: value.name,
        img: value.img,
        quantity: value.quantity!+quantity,
        isExist: true,
        time: DateTime.now().toString(),
      );
    });
   }
   else
   {
    
 if(quantity>0)
 {
  _items.putIfAbsent(product.id!, () {
      return CartModal(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString());
    });

 }else{
 Get.snackbar("ItemCount", "You should at least add an item in the cart !",
    backgroundColor: AppColors.mainColor,
  colorText: Colors.white);
 }


   }

   
    
  }
  
  bool exitInCart(ProductModal product)
  {
    if(_items.containsKey(product.id))
    {
      return true;
    }
    return false;
    
  }

int getQuantity(ProductModal product)
{
  var quantity=0;
  if(_items.containsKey(product.id)){
    _items.forEach((key, value) { 
      if(key==product.id){
         quantity=value.quantity!;
      }
    });
  }
  return quantity;
}

}

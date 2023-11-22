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
  List<CartModal> storageItems=[];

  void addItem(ProductModal product, int quantity) {
   var totalQuantity=0;


   if(_items.containsKey(product.id))
   {
    _items.update(product.id!, (value){
      totalQuantity=value.quantity!+quantity;
      return CartModal(
        id: value.id,
        name: value.name,
        img: value.img,
        quantity: value.quantity!+quantity,
        price: value.price,
        isExist: true,
        time: DateTime.now().toString(),
        product: product,
      );

     
    });
    if(totalQuantity<=0){
      _items.remove(product.id!);
    }
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
          time: DateTime.now().toString(),
          product: product);
    });

 }else{
 Get.snackbar("ItemCount", "You should at least add an item in the cart !",
    backgroundColor: AppColors.mainColor,
  colorText: Colors.white);
 }


   }
   cartRepo.addToCartList(getItems);
   update();
    
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

int get totalItems{
  var totalQuantity=0;
  _items.forEach((key, value) { 
    totalQuantity+=value.quantity!;
  });

  return totalQuantity;
}


List<CartModal> get getItems{
 return _items.entries.map((e){
    return e.value;
  }).toList();
}

int get totalAmount{
  int total=0;

  _items.forEach((key, value) { 
    total+=value.quantity!*value.price!;
  });

  return total;
}

 List<CartModal> getCartData(){
setCart=cartRepo.getCartList();
return storageItems;
 }

 set setCart(List<CartModal> items){
  storageItems=items;
  for(int i=0;i<storageItems.length;i++){
    _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
  }
 }

void addToHistory(){
  cartRepo.addToCartHistoryList();
  clear();
}
void clear(){
  _items={};
  update();

}

List<CartModal> getCartHistoryList(){
  return cartRepo.getCartHistoryList();
}
}

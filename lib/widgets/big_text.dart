import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({super.key,this.color=const Color(0xff332d2b), 
 required this.text,
 this.size=0,
 this.overflow=TextOverflow.ellipsis
 });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(color: color,fontSize:size==0 ? Dimensions.font20 : size,fontWeight: FontWeight.w400,fontFamily: 'Roboto'),
    );
  }
}
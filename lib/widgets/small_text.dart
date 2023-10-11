import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/dimensions.dart';

class SmallText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  double height;
  SmallText({super.key,this.color=const Color(0xffccc7c5), 
 required this.text,
 this.size=0.0,
 this.height=1.2
 });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color,fontSize: size==0? Dimensions.font12 : size,fontFamily: 'Roboto',height: height),
    );
  }
}
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  FontWeight? weight;

   MyText({required this.text,this.color,this.weight,this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: size,fontWeight: weight,color: color),);
  }
}

import 'package:flutter/material.dart';

class Utils{

  static void showSnackBar( BuildContext context, String msg){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg))
    );
  }


}
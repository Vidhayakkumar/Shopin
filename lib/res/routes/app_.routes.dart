
import 'dart:core';
import 'package:addlens_assign/screens/cart_screen.dart';
import 'package:addlens_assign/screens/home_screen.dart';
import 'package:addlens_assign/screens/login_screen.dart';
import 'package:addlens_assign/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{


  static const String login = '/log_in';
  static const String signUp = '/sign_up';
  static const String  homeScreen = '/home_page';
  static const String cartScreen = '/cart_screen';
  static const String wishlistScreen= '/wishlist_screen';




  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case login :
        return MaterialPageRoute(builder: (_)=>LogInScreen());

      case homeScreen:
        return MaterialPageRoute(builder: (_)=>HomeScreen());

      // case signUp:
      //   return MaterialPageRoute(builder: (_)=> SignupPage());



      case cartScreen:
        return MaterialPageRoute(builder: (_)=> CartScreen());

      case wishlistScreen:
        return MaterialPageRoute(builder: (_)=> WishlistScreen());


      default:
        return MaterialPageRoute(builder: (_)=> SizedBox.shrink()
        );
    }
  }


}
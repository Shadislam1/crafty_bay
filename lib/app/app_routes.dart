

import 'package:crafty_bay/features/common/ui/screen/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_category_screen.dart';

import 'package:flutter/material.dart';

import '../features/ui/screen/login_screen.dart';
import '../features/ui/screen/sign_up_screen.dart';
import '../features/ui/screen/splash_screen.dart';

class AppRoutes{
  static Route<dynamic> routes(RouteSettings settings){
    late final Widget screenWidget;
    if(settings.name == SplashScreen.name){
      screenWidget = SplashScreen();
    }else if(settings.name == LoginScreen.name ){
      screenWidget = LoginScreen();
    }else if(settings.name == SignUpScreen.name){
      screenWidget = SignUpScreen();
    }else if(settings.name == MainBottomNavScreen.name){
      screenWidget = MainBottomNavScreen();
    }
    return MaterialPageRoute(builder: (context)=> screenWidget);

  }
}
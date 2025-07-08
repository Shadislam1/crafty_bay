

import 'package:flutter/material.dart';

import '../home/ui/screens/home_screen.dart';
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
    }else if(settings.name == HomeScreen.name){
      screenWidget = HomeScreen();
    }
    return MaterialPageRoute(builder: (context)=> screenWidget);

  }
}
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/app_routes.dart';
import 'package:crafty_bay/app/app_theme.dart';
import 'package:crafty_bay/app/controller_binder.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/ui/screen/splash_screen.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      initialRoute: SplashScreen.name,
      theme:AppTheme.lightThemeData,
      onGenerateRoute: AppRoutes.routes,
      initialBinding: ControllerBinder() ,

    );

  }
}

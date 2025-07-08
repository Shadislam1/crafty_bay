
import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';
import '../../../home/ui/screens/home_screen.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static final String name = '/';


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    _moveToHomeScreen();
  }
  Future<void> _moveToHomeScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, HomeScreen.name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              const SizedBox(height: 16,),
              Text('Version 1.0.0',style: TextStyle(color: Colors.grey,),
              ),
            ],

          ),
        ),
      ),
    );
  }
}



import 'package:crafty_bay/features/cart/ui/screens/cart_screen.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/product/ui/screens/product_category_screen.dart';
import 'package:crafty_bay/features/wishlist/ui/screen/wish_list.dart';
import 'package:crafty_bay/home/ui/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});
    static final String  name = '/main-bottom-nav';
  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screen = [
    HomeScreen(),
    ProductCategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (navController) {
        return Scaffold(

          body: _screen[navController.selectedIndex],
          bottomNavigationBar:NavigationBar(
            selectedIndex: navController.selectedIndex,
            onDestinationSelected:navController.changeIndex,
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.category_outlined), label: 'Category'),
                NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
                NavigationDestination(icon: Icon(Icons.favorite_outlined), label: 'Wishlist'),
              ]
          ),
        );
      }
    );
  }
}

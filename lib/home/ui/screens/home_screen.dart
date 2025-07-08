import 'package:crafty_bay/app/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_bar_icon_button.dart';
import '../widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            ProductSearchBar()
          ],
        ),
      ),
    );
  }



  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetPaths.navAppLogoSvg,
          ),
      actions: [
        AppBarIconButton(iconData: Icons.person,onTap: (){},),
        AppBarIconButton(iconData: Icons.call,onTap: (){},),
        AppBarIconButton(iconData: Icons.notifications,onTap: (){},),



      ],
      //title: Text('home'),
    );
  }
}



import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/product/ui/screens/product_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../features/common/ui/widgets/product_card.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_carousel_slider.dart';
import '../../../features/common/ui/widgets/product_category_item.dart';
import '../widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16,),
        
              ProductSearchBar(),
              const SizedBox(height: 16,),
              HomeCarouselSlider(),
              const SizedBox(height: 16,),
              _buildSectionHeader(title: 'Catagories', onTapSeeAll: () {
                Get.find<MainBottomNavController>().moveToCategory();
              }),
              _getCategoryList(),
              _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _getPopularProduct(),
              _buildSectionHeader(title: 'Speacial', onTapSeeAll: () {}),
              _getSpecialProduct(),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
              _getNewProduct(),
              const SizedBox(height: 8,),
        
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPopularProduct(){

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 8,
          children: [1,2,3,4].map((e)=>ProductCard()).toList()),
        );

  }

  Widget _getSpecialProduct(){

    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,

        itemBuilder: (context,index){

          return ProductCard();
      }
        ,
        separatorBuilder: ( context,  index) {
          return SizedBox(width: 8,);
        }, ),
    );

  }

  Widget _getNewProduct(){

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          spacing: 8,
          children: [1,2,3,4,5].map((e)=>ProductCard()).toList()),
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

  Widget _buildSectionHeader({required String title,required VoidCallback onTapSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style:Theme.of(context).textTheme.titleSmall,),
        TextButton(
            onPressed: onTapSeeAll, child: Text('See all')),
      ],
    );
  }
  Widget _getCategoryList(){
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        itemCount:  10,
          itemBuilder:(context, index){
            return ProductCategoryItem();
          },
        separatorBuilder: ( context,  index)=> const SizedBox(width: 8,),
      ),
    );
  }
}









import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../../../common/ui/controllers/main_bottom_nav_controller.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:(_,__){
        _backToHome();
      } ,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          leading:IconButton(onPressed: _backToHome, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
           Expanded(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8),
                 child: ListView.separated(
                              itemCount: 12,
                 itemBuilder: (context,index){
                   return CartItem();
                 },
                   separatorBuilder: (_,__)=> const SizedBox(height: 4,),
                 ),
               )),
      
            _buildPriceAndAddToCheckoutSection(),
          ],
      
        ),
      ),
    );

    }
  Widget _buildPriceAndAddToCheckoutSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.3),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight:Radius.circular(16),
          ),


      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(' Total Price',style: Theme.of(context).textTheme.bodyLarge),

              Text('${Constants.takaSign}100',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.themeColor,
              ),),
            ],
          ),
          SizedBox(
              width: 120,
              child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
        ],
      ),
    );
  }
  }



void _backToHome(){
  Get.find<MainBottomNavController>().backToHome();
}



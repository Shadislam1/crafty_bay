import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';

import 'package:crafty_bay/features/product/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';


import '../widgets/product_details_info.dart';
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product- details';

  final String  productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  productDetailsInfo(),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.15),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
                topRight:Radius.circular(16) )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
              children: [
                Text('Price',style: Theme.of(context).textTheme.bodyLarge),
                Text('${Constants.takaSign}100',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.themeColor,
                ),),
              ],
              ),
              SizedBox(
                width: 120,
                  child: ElevatedButton(onPressed: (){}, child: Text('Add to card'))),
            ],
          ),
        );
  }
}



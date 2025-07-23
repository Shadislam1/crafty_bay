import 'package:crafty_bay/features/product/ui/screens/reviews_page.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import 'color_picker.dart';
import 'inc_dec_button.dart';
class productDetailsInfo extends StatelessWidget {
  const productDetailsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                child: Text('Nike 1204HST -new shoe of 2025',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  color: Colors.black54,
                ),),
              ),
              IncDecButton(onChanged: (int  value) {  },),
            ],
          ),
          Row(
            children: [
              Wrap(
                children: [
                  Icon(Icons.star,size: 18,color: Colors.amber,),
                  Text('4.5'),

                ],
              ),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, ReviewsPage.name);
              }, child: Text('Reviews')),
              Card(
                color: AppColors.themeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.favorite_outline,
                    color: Colors.white,),
                ),
              ),
            ],
          ),
          Text('Color',style: TextStyle(
            fontSize: 16,
            fontWeight:FontWeight.w600,

          ),
          ),
          const SizedBox(height: 8,),
          ColorPicker(colors: ['Black','Blue','Pink','white','yellow'], onSelected: (String  value) {

          },
          ),
          const SizedBox(height: 16,),


          Text(
            'Size',style: TextStyle(
            fontSize: 16,
            fontWeight:FontWeight.w600,

          ),
          ),
          const SizedBox(height: 8,),
          ColorPicker(
            colors: ['S','M','L','XL','XXL'], onSelected: (String  value) {

          },
          ),
          const SizedBox(height: 16,),

          Text(
            'Description',
            style: TextStyle(
              fontSize: 16,
              fontWeight:FontWeight.w600,

            ),
          ),
          const SizedBox(height: 8,),
          Text('''There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.''',style: TextStyle(
            color: Colors.grey,
          ),)
        ],
      ),
    );
  }
}
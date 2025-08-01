import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import '../../../product/ui/widgets/inc_dec_button.dart';
class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.white,
      child: Row(
        children: [
          Container(
            height:100,
            width:100,
            padding: EdgeInsets.all(8),
            child: Image.asset(AssetPaths.dummyNikeShoePng,fit: BoxFit.scaleDown,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4,right: 12,bottom: 16,top: 4),
              child: Column(
                spacing: 6,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Text('Nike 1204HST -new shoe of 2025',
                                maxLines: 1,
                                style: TextStyle(

                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.6,
                                  color: Colors.black54,
                                  overflow: TextOverflow.ellipsis,
                                ),),
                              Text(
                                'color:Black Size: XL',
                                maxLines: 1,
                                style: TextStyle(

                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.6,
                                  color: Colors.black54,
                                  overflow: TextOverflow.ellipsis,
                                ),),

                              const SizedBox(height: 8,),


                            ],
                          )),
                      IconButton(onPressed: (){}, icon:Icon(Icons.delete_forever_outlined)),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${Constants.takaSign}100',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.themeColor,
                        ),
                      ),
                      IncDecButton(onChanged: (int value){},),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
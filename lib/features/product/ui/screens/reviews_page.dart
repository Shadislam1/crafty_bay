


import 'package:crafty_bay/features/product/ui/screens/review_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_reviews_page.dart';





class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  static final name = '/reviews-page';

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  List<Review> reviews = [];

  void _addReview(Review review) {
    setState(() {
      reviews.add(review);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Reviews'),
        leading:IconButton(onPressed: (){
            Get.back();
        },icon:Icon(Icons.arrow_back_ios) ,)
      ),
      body:  Column(
        children: [
          Expanded(
            child: reviews.isEmpty
                ? Center(child: Text('No reviews yet'))
                : ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,

                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),

                                child:  Icon(
                                    Icons.person_outline,color: Colors.grey.shade600,size: 22,),


                            ),
                            const SizedBox(height: 8,),
                            Text(
                              '${review.firstName} ${review.lastName}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),

                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(review.content),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews (${reviews.length})',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    final result = await Navigator.push<Review>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateReviewsPage(),
                      ),
                    );
                    if (result != null) {
                      _addReview(result);
                    }
                  },
                  child: Icon(Icons.add),
                  mini: true,
                )
              ],
            ),
          ),
        ],
      ),


    );

  }
}








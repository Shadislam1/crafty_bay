import 'package:crafty_bay/features/product/ui/screens/review_class.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CreateReviewsPage extends StatefulWidget {
  const CreateReviewsPage({super.key});
  static final name = '/create-reviews-page';
  @override
  State<CreateReviewsPage> createState() => _CreateReviewsPageState();

}

class _CreateReviewsPageState extends State<CreateReviewsPage> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _contentTEController = TextEditingController();

 void _submitButton() {
   if (_formKey.currentState!.validate()) {
     final newReview = Review(
       firstName: _firstNameTEController.text.trim(),
       lastName: _lastNameTEController.text.trim(),
       content: _contentTEController.text.trim(),
     );
     Navigator.pop(context, newReview); // Send review back
   }
 }

 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Reviews'),
          leading: IconButton(onPressed: (){
            Get.back();
          },
            icon:Icon(Icons.arrow_back_ios),
          )
      ),
        body: SingleChildScrollView(
          child: Padding(
          
            padding: const EdgeInsets.all(24.0),
          
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(

                children: [
                const  SizedBox(height: 16,),
                  TextFormField(
                    controller: _firstNameTEController,
                    keyboardType:TextInputType.text,
                    textInputAction: TextInputAction.next,

                    decoration: InputDecoration(

                      hintText: 'Frist Name',

                    ),
                    validator: (String? value){

                      if(value?.trim().isEmpty ?? true){
                        return 'Enter a valid  first name';
                      }
                      return null;
                    },
                  ),
                const  SizedBox(height: 16,),
                  TextFormField(
                    controller: _lastNameTEController,
                    keyboardType:TextInputType.text,
                    textInputAction: TextInputAction.next,

                    decoration: InputDecoration(

                      hintText: 'Last Name',

                    ),
                    validator: (String? value){

                      if(value?.trim().isEmpty ?? true){
                        return 'Enter a valid  last name';
                      }
                      return null;
                    },
                  ),
                 const SizedBox(height: 16,),
                  TextFormField(
                    controller: _contentTEController,
                    keyboardType:TextInputType.text,
                    textInputAction: TextInputAction.next,
                    maxLines: 6,

                    decoration: InputDecoration(

                      hintText: 'Write Reviews',

                    ),
                    validator: (String? value){

                      if(value?.trim().isEmpty ?? true){
                        return 'Write your review';
                      }
                      return null;
                    },

                       
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(onPressed: _submitButton, child: Text('Submit')),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

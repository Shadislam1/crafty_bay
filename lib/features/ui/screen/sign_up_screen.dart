import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/core/ui/widgets/snack_bar_message.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_request_model.dart';
import 'package:crafty_bay/features/ui/controller/sign_up_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/ui/widgets/centered_circular_progress_indicator.dart';
import '../widgets/app_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static final String name = '/sign-up';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [

                  AppLogo(
                    width: 90,
                    height: 90,
                  ),
                const  SizedBox(height: 16,),
                  Text('Register Account ',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4,),
                  Text(' Enter your details to  sign up',style: textTheme.headlineMedium,
                  ),
                  const  SizedBox(height: 24,),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Email",

                    ),

                    validator: (String? value){
                      String emailValue = value ?? '';
                      if(EmailValidator.validate(emailValue)==false){
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const  SizedBox(height: 8,),
                  TextFormField(
                    controller: _firstNameTEController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "First name",

                    ),

                    validator: (String? value){

                      if(value?.trim().isEmpty ?? true){
                        return 'Enter a valid  first name';
                      }
                      return null;
                    },
                  ),
                  const  SizedBox(height: 8,),
                  TextFormField(
                    controller: _lastNameTEController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Last name",

                    ),

                    validator: (String? value){

                      if(value?.trim().isEmpty ?? true){
                        return 'Enter a valid  last name';
                      }
                      return null;
                    },
                  ),
                  const  SizedBox(height: 8,),
                  TextFormField(
                    controller: _mobileTEController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "mobile number",

                    ),

                    // regex eh validation add korte hbe
                    validator: (String? value) {
                      String input = value?.trim() ?? '';
                      if (input.isEmpty) {
                        return 'Enter your mobile number';
                      }
                      final RegExp bdPhoneRegex = RegExp(r'^(?:\+?88)?01[3-9]\d{8}$');
                      if (!bdPhoneRegex.hasMatch(input)) {
                        return 'Enter a valid Bangladeshi mobile number';
                      }
                      return null;
                    },

                  ),
                  const  SizedBox(height: 8,),
                  TextFormField(
                    controller: _passwordTEController,

                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                    validator: (String? value){

                      if((value?.length?? 0)<=6){
                        return 'Enter a password more than 6 letters';
                      }
                      return null;
                    },
                  ),
                  const  SizedBox(height: 8,),
                  TextFormField(
                    controller: _cityTEController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "city name",

                    ),

                    validator: (String? value){

                      if(value?.trim().isEmpty ?? true){
                        return 'Enter a valid  city name';
                      }
                      return null;
                    },
                  ),

                  const  SizedBox(height: 8,),
                  TextFormField(
                    controller: _addressTEController,
                  //  keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    maxLines: 3,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: " shiping Address ",

                    ),

                    validator: (String? value){

                      if(value?.trim().isEmpty ?? true){
                        return 'Enter a valid  address name';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16,),
                  GetBuilder<SignUpController>(
                    builder: (_) {
                      return Visibility(
                        visible: _signUpController.inProgress == false,
                        replacement: CenteredCircularProgressIndicator(),
                        child: ElevatedButton(
                        
                          onPressed:_onTapSignUpButton,
                          child:Text('Sign Up'),
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 32,),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapSignUpButton() async {
    if(_formKey.currentState!.validate()){
      final SignUpRequestModel model = SignUpRequestModel(
          email:_emailTEController.text.trim(),
          firstName: _firstNameTEController.text.trim(),
          lastName:_lastNameTEController.text.trim(),
          password: _passwordTEController.text,
          city: _cityTEController.text.trim(),
          phone: _mobileTEController.text.trim());
        final bool isSuccess = await _signUpController.signUp(model);
        if(isSuccess){
            //TODO Navigate to verify otp screen
         // Navigator.pushNamed(context, routeName)
          showSnackBarMessage(context, _signUpController.message);
        }else{
          showSnackBarMessage(context, _signUpController.errorMessage!, true);
        }
    }
  }
  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _addressTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}



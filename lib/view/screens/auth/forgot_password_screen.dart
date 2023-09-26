import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_form_field.dart';

class ForgotPassowrdScreen extends StatelessWidget {

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor:context.theme.backgroundColor,
            elevation: 0.0,
            title:  Text('Forgot Password',style: TextStyle(
              color:  Get.isDarkMode ? Colors.white : Colors.black
            ),
            ),
            leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back,color: Get.isDarkMode ? Colors.white : Colors.black,)

            ),

          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon:  Icon(Icons.close_rounded,color: Get.isDarkMode
                            ? Colors.black : Colors.white,),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('If you want to recover your account.then please provide your email ID below..'
                      ,style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Image.asset('assets/images/forgetpass copy.png',
                      width: 300,
                    ),
                    const SizedBox(height: 10),
                    AuthTextFormField(
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      obscureText: false,
                      validator: (value){
                        if(!RegExp(validationEmail).hasMatch(value)){
                          return 'Invalid Email';
                        }
                        else{
                          return null;
                        }
                      },
                      prefixIcon: Get.isDarkMode ?  Image.asset('assets/images/email.png') :const Icon(Icons.email,color: Colors.pink,size: 28,),
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 10),
                   GetBuilder<AuthController>(builder: (_) =>  AuthButton(text: 'SEND',
                       onPressed: (){
                     if(formKey.currentState!.validate()){
                       controller.resetPassword(emailController.text.trim());
                     }
                       }
                   ),
                   ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

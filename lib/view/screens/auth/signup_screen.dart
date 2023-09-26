import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/my_string.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/screens/auth/login_screen.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/bottom_container.dart';
import '../../widgets/auth/check_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 570,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'SIGN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                            ),
                            const SizedBox(width: 3),
                            TextUtils(
                              text: 'Up',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        AuthTextFormField(
                          inputType: TextInputType.name,
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter Valid Name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/user.png')
                              : const Icon(
                                  Icons.person,
                                  color: Colors.pink,
                                  size: 28,
                                ),
                          hintText: 'User Name',
                        ),
                        const SizedBox(height: 20),
                        AuthTextFormField(
                          inputType: TextInputType.emailAddress,
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/email.png')
                              : const Icon(
                                  Icons.email,
                                  color: Colors.pink,
                                  size: 28,
                                ),
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(
                          builder: (_) => AuthTextFormField(
                            inputType: TextInputType.visiblePassword,
                            controller: passwordController,
                            obscureText: controller.isVisibility ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer or equal to 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/lock.png')
                                : const Icon(
                                    Icons.lock,
                                    color: Colors.pink,
                                    size: 28,
                                  ),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        CheckWidget(),
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(
                          builder: (_) => AuthButton(
                            onPressed: () {
                              if(controller.isCheck == false)
                              {
                                Get.snackbar('Check Box', 'Please Accept Term & Conditions',
                                snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.white,
                                  colorText: Colors.black,
                                );
                              }
                              else if (formKey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.signUp(
                                  name: name,
                                  email: email,
                                  password: password,
                                );
                              }
                            },
                            text: 'SIGN UP',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                text: 'Already have an Account?',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                textType: 'Log in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce/view/screens/auth/forgot_password_screen.dart';
import 'package:ecommerce/view/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/bottom_container.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/text_utils.dart';
import 'login_screen.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
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
                              text: 'Log',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                            ),
                            const SizedBox(width: 3),
                            TextUtils(
                              text: 'In',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: 'Forgot Password?',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const SizedBox(height: 20),
                      GetBuilder<AuthController>(builder: (_) =>   AuthButton(
                        onPressed: ()
                        {
                          if(formKey.currentState!.validate()){
                            String email = emailController.text.trim();
                            String password = passwordController.text;
                            controller.logIn(
                                email: email,
                                password: password
                            );
                          }
                        },
                        text: 'LOG IN',
                      ),),
                        const SizedBox(height: 20),
                        TextUtils(
                            text: 'Or',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){},
                                child: Image.asset('assets/images/facebook.png'),
                            ),
                            const SizedBox(width: 20),
                          GetBuilder<AuthController>(builder: (_) =>   InkWell(
                            onTap: ()
                            {
                              controller.googleLogIn();
                            },
                            child: Image.asset('assets/images/google.png'),
                          ),),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                text: 'Don\'t have an Account?',
                onPressed: () {
                  Get.to(SignUpScreen());
                },
                textType: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

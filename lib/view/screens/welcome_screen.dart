import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/screens/auth/login_screen.dart';
import 'package:ecommerce/view/screens/auth/signup_screen.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/auth_controller.dart';

class WelcomeScreen extends StatelessWidget {
  final controller = Get.lazyPut(() => AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children:  [
             SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/images/background.jpg',
              fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Center(
                        child: TextUtils(
                          text: 'Welcome',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                            text: 'Shopy',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                        ),
                        const SizedBox(width: 9),
                        TextUtils(
                            text: 'Shop',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 250),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal:
                          40,vertical: 12,
                      ),
                    ),
                      onPressed: () {
                        Get.offNamed(Routes.loginScreen);

                      },
                      child:  TextUtils(
                          text: 'Get Start',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                      ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          text: 'Don\'t have an account? ',
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                      ),
                      TextButton(
                          onPressed: ()
                          {
                            Get.to(SignUpScreen());
                          },
                          child: TextUtils(
                            text: 'Sign Up',
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                            underLine: TextDecoration.underline,
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:badges/badges.dart' as badges;
import 'package:ecommerce/logic/controllers/cart_controller.dart';
import 'package:ecommerce/logic/controllers/main_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          appBar: AppBar(
            elevation: 0.0,
            // leading: Container(),
            actions: [
             Obx((){
                 return Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: badges.Badge(
                     position: badges.BadgePosition.topEnd(top: -10, end: -10),
                     badgeAnimation: const badges.BadgeAnimation.rotation(
                       animationDuration: Duration(seconds: 1),
                       colorChangeAnimationDuration: Duration(seconds: 1),
                       loopAnimation: false,
                       curve: Curves.fastOutSlowIn,
                       colorChangeAnimationCurve: Curves.easeInCubic,
                     ),
                     badgeContent: Text(
                       '${cartController.quantity().toString()}',
                       style: const TextStyle(color: Colors.white),
                     ),
                     child: IconButton(
                       onPressed: () {
                         Get.toNamed(Routes.cartScreen);
                       },
                       icon: Image.asset('assets/images/shop.png'),
                     ),
                   ),
                 );



             })

            ],
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            elevation: 0.0,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Category'),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Favorite'),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        );
      }),
    );
  }
}

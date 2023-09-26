import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/logic/controllers/cart_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'color_picker.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;

  ImageSliders({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _ImageSlidersState createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();
  final cartController = Get.find<CartController>();
  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
    int currentPage = 0;
    int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.imageUrl), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
          options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              }),
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                dotColor: Colors.white),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
                itemBuilder: (context,index) => GestureDetector(
                  onTap: (){
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: ColorPicker(
                      outerBorder: currentColor == index,
                      color: colorSelected[index]
                  ),
                ),
                separatorBuilder:  (context,index) => const SizedBox(height: 3,),
                itemCount: colorSelected.length,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    // color: Get.isDarkMode ? pinkClr.withOpacity(0.8) : mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Obx((){
                return badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10, end: -10),
                  badgeContent: Text(
                    '${cartController.quantity().toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  badgeAnimation: badges.BadgeAnimation.rotation(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr.withOpacity(0.8) : mainColor.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                );
              })
            ],
          ),

        ),
      ],
    );
  }
}

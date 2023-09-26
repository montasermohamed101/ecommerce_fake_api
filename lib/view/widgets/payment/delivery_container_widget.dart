import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/logic/controllers/payment_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColors = false;
  final TextEditingController phoneController = TextEditingController();

  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          address: 'Egypt',
          name: 'Shopy Store',
          phone: '0120',
          title: 'Shopy Shop',
          value: 1,
          color: changeColors ? Colors.white : Colors.grey.shade300,
          icon: Container(),
          onChanged: (int? value)
          {
            setState(() {
              radioContainerIndex = value!;
              changeColors = !changeColors;
            });
          }
        ),
        const SizedBox(height: 15),
       Obx((){
         return  buildRadioContainer(
             address: controller.address.value,
             name: '${authController.displayUserName}',
             phone: controller.phoneNumber.value,
             title: 'Delivery',
             value: 2,
             color: changeColors ? Colors.grey.shade300 :Colors.white ,
             icon: InkWell(
               onTap: (){
                 Get.defaultDialog(
                   title: 'Enter Your Phone Number',
                   titleStyle: const TextStyle(
                     fontSize: 16,
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ),
                   backgroundColor: Colors.white,
                   radius: 10,
                   textCancel: 'Cancel',
                   cancelTextColor: Colors.black,
                   textConfirm: 'Save ',
                   confirmTextColor: Colors.black,
                   onCancel: (){
                     Get.toNamed(Routes.paymentScreen);
                   },
                   onConfirm: (){
                     Get.back();
                     controller.phoneNumber.value = phoneController.text;
                   },
                   buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                   content: Padding(
                     padding: const EdgeInsets.all(10),
                     child: TextField(
                       controller: phoneController,
                       cursorColor: Colors.black,
                       maxLength: 11,
                       keyboardType: TextInputType.text,
                       onSubmitted: (value)
                       {
                         phoneController.text = value;
                       },
                       style: const TextStyle(
                         color: Colors.black,
                       ),
                       decoration:  InputDecoration(
                         fillColor: Get.isDarkMode ? pinkClr.withOpacity(0.1)  : mainColor.withOpacity(0.2),
                         focusColor: Colors.red,
                         prefixIcon:  Icon(
                           Icons.phone,
                           color: Get.isDarkMode ? pinkClr : mainColor,
                         ),
                         suffixIcon: IconButton(
                           onPressed: ()
                           {
                             phoneController.clear();
                           },
                           icon: const Icon(
                             Icons.close,
                             color: Colors.black,
                           ),
                         ),
                         hintText: 'Enter Your Phone Number',
                         hintStyle: const TextStyle(
                           color: Colors.black45,
                           fontSize: 14,
                           fontWeight: FontWeight.w500,
                           overflow: TextOverflow.ellipsis,
                         ),
                         filled: true,
                         enabledBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                             color: Colors.white,
                           ),
                           borderRadius: BorderRadius.circular(20),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                             color: Colors.white,
                           ),
                           borderRadius: BorderRadius.circular(20),
                         ),
                         errorBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                             color: Colors.white,
                           ),
                           borderRadius: BorderRadius.circular(20),
                         ),
                         focusedErrorBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                             color: Colors.white,
                           ),
                           borderRadius: BorderRadius.circular(20),
                         ),
                       ),
                     ),
                   ),
                 );
               },
               child: Icon(Icons.contact_phone,
                 size: 20,
                 color: Get.isDarkMode ? pinkClr : mainColor,
               ),
             ),
             onChanged: (int? value)
             {
               setState(() {
                 radioContainerIndex = value!;
                 changeColors = !changeColors;
               });
               controller.updatePosition();
             }
         );
       })

      ],
    );
  }

  buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height /5.4,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (int? value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
                TextUtils(
                  text: name,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    TextUtils(
                      text: '🇪🇬 +02 ',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    TextUtils(
                      text: phone,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 120),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                TextUtils(
                  text: address,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}

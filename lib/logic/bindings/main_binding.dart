import 'package:ecommerce/logic/controllers/main_controller.dart';
import 'package:ecommerce/logic/controllers/payment_controller.dart';
import 'package:ecommerce/logic/controllers/settings_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(PaymentController(),permanent: true);
  }

}
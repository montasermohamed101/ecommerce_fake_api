import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/logic/controllers/theme_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/my_string.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'language/localiztion.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final controller = Get.lazyPut(() => AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, child!),
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.resize(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ],
            breakpointsLandscape: [
              const ResponsiveBreakpoint.resize(560, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(812, name: MOBILE),
              const ResponsiveBreakpoint.resize(1024, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1120,
                  name: TABLET),
            ]);
      },
      title: 'Ecommerce Shop',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      fallbackLocale: Locale(en),
      translations: LocalizationApp(),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null
          || GetStorage().read<bool>('auth') == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}


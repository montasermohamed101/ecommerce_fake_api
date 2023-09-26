import 'package:ecommerce/language/en.dart';
import 'package:get/route_manager.dart';

import 'ar.dart';
import 'fr.dart';


class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
        'fr': fr,
      };
}

import 'package:get/get.dart';
import 'package:omar_apps/utils/my_string.dart';

import 'ar.dart';
import 'en.dart';
import 'fr.dart';

@override
class LocaliztionApp extends Translations {
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}

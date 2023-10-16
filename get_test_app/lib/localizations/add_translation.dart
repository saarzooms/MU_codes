import 'package:get/get.dart';

import 'langauages/ar.dart';
import 'langauages/en.dart';
import 'langauages/fr.dart';

class AddTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "ar": ar,
        "fr": fr,
      };
}

import 'package:get/get.dart';

import 'en_language.dart';
import 'es_language.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'es_BD': EsLanguage().esLanguage,
        'en_US': EnLanguage().enLanguage,
      };
}

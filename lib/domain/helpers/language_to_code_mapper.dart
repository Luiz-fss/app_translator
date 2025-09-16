import 'package:google_mlkit_translation/google_mlkit_translation.dart';

import '../../domain/helpers/language.dart';

class LanguageToCodeMapper {

  static String mapLanguageToCode(Language language){
    switch(language){
      case Language.english:
        return "en-US";
      case Language.portuguese:
        return "pt-PT";
      case Language.french:
        return "es-ES";
      case Language.spanish:
        return "pt-PT";
    }
  }
}
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

import '../../domain/helpers/language.dart';

class LanguageMapper {

  static TranslateLanguage mapToMLKit(Language language){
    switch(language){
      case Language.english:
        return TranslateLanguage.english;
      case Language.portuguese:
        return TranslateLanguage.portuguese;
      case Language.french:
        return TranslateLanguage.french;
      case Language.spanish:
        return TranslateLanguage.spanish;
    }
  }
}
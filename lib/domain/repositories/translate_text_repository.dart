import 'package:google_mlkit_translation/google_mlkit_translation.dart';

import '../helpers/language.dart';

abstract class TranslateTextRepository {

  Future<String> translate(TranslateTextParams params);
}

class TranslateTextParams {
  final String textTranslate;
  final Language sourceLanguage;
  final Language targetLanguage;

  TranslateTextParams({required this.textTranslate, required this.sourceLanguage, required this.targetLanguage});
}
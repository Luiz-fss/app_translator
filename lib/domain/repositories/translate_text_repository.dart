import 'package:google_mlkit_translation/google_mlkit_translation.dart';

abstract class TranslateTextRepository {

  Future<String> translate(TranslateTextParams params);
}

class TranslateTextParams {
  final String textTranslate;
  final String sourceLanguage;
  final String targetLanguage;

  TranslateTextParams({required this.textTranslate, required this.sourceLanguage, required this.targetLanguage});
}
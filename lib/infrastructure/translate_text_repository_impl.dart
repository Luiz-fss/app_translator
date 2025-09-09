import 'package:app_translate/domain/repositories/translate_text_repository.dart';
import 'package:app_translate/infrastructure/mappers/language_mapper.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslateTextRepositoryImpl implements TranslateTextRepository{
  @override
  Future<String> translate(TranslateTextParams params) async{
   final onDeviceTranslator = OnDeviceTranslator(
       sourceLanguage: LanguageMapper.mapToMLKit(params.sourceLanguage),
       targetLanguage: LanguageMapper.mapToMLKit(params.targetLanguage));

   return await onDeviceTranslator.translateText(params.textTranslate);
  }
}
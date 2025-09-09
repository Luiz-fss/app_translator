

import 'package:app_translate/domain/repositories/translate_text_repository.dart';
import 'package:app_translate/infrastructure/translate_text_repository_impl.dart';

class TranslateTextUsecase {

  final TranslateTextRepository translateRepositoryImpl;

  TranslateTextUsecase(this.translateRepositoryImpl);

  Future<String> call(TranslateTextParams params)async{
    return await translateRepositoryImpl.translate(params);
  }
}
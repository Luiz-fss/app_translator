

import 'package:app_translate/domain/repositories/translate_text_repository.dart';

class TranslateTextUsecase {

  final TranslateTextRepository _translateRepositoryImpl;

  TranslateTextUsecase(this._translateRepositoryImpl);

  Future<String> call(TranslateTextParams params)async{
    if(!await _translateRepositoryImpl.isModelDownloaded(params.sourceLanguage)){
      await _translateRepositoryImpl.downloadModel(params.sourceLanguage);
    }

    if(!await _translateRepositoryImpl.isModelDownloaded(params.targetLanguage)){
      await _translateRepositoryImpl.downloadModel(params.targetLanguage);
    }
    return await _translateRepositoryImpl.translate(params);
  }
}
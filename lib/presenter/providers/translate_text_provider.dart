

import 'package:app_translate/domain/entities/translate_text_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TranslateTextState{

   TranslateTextEntity? translateTextEntity;
   bool isDownLoading;

   TranslateTextState({this.translateTextEntity, this.isDownLoading = false});
}


class TranslateTextNotifier extends StateNotifier<AsyncValue<TranslateTextState>>{
  TranslateTextNotifier():super (AsyncData(TranslateTextState(
    translateTextEntity: null,
    isDownLoading: false
  )));
}
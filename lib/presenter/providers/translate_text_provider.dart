import 'package:app_translate/domain/entities/translate_text_entity.dart';
import 'package:app_translate/domain/repositories/translate_text_repository.dart';
import 'package:app_translate/domain/usecases/translate_text_usecase.dart';
import 'package:app_translate/infrastructure/translate_text_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TranslateTextState {
  TranslateTextEntity? translateTextEntity;
  bool isDownLoading;

  TranslateTextState({this.translateTextEntity, this.isDownLoading = false});

  TranslateTextState copyWith({
    TranslateTextEntity? translateTextEntity,
    bool? isDownLoading,
  }) {
    return TranslateTextState(
      translateTextEntity: translateTextEntity ?? this.translateTextEntity,
      isDownLoading: isDownLoading ?? this.isDownLoading,
    );
  }
}

class TranslateTextNotifier
    extends StateNotifier<AsyncValue<TranslateTextState>> {
  TranslateTextNotifier(this.translateTextUsecase)
    : super(
        AsyncData(
          TranslateTextState(translateTextEntity: null, isDownLoading: false),
        ),
      );

  final TranslateTextUsecase translateTextUsecase;

  Future<void> translate(TranslateTextParams params) async {
    state = AsyncData(state.value!.copyWith(isDownLoading: true));

    final translatedText = await translateTextUsecase.call(params).catchError((
      onError,
    ) {
      return "Algo errado aconteceu $onError";
    });

    state = AsyncData(
      state.value!.copyWith(
        isDownLoading: false,
        translateTextEntity: TranslateTextEntity(
          translatedText: translatedText,
        ),
      ),
    );
  }
}

final translateTextProvider =
    StateNotifierProvider<
      TranslateTextNotifier,
      AsyncValue<TranslateTextState>>(
      (ref) => TranslateTextNotifier(
        TranslateTextUsecase(TranslateTextRepositoryImpl()),
      ),
    );

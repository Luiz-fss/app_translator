import 'package:app_translate/domain/helpers/language.dart';
import 'package:app_translate/domain/helpers/language_to_code_mapper.dart';
import 'package:app_translate/domain/repositories/translate_text_repository.dart';
import 'package:app_translate/infrastructure/services/clipboard_service.dart';
import 'package:app_translate/infrastructure/services/text_to_speech_service.dart';
import 'package:app_translate/presenter/components/custom_drop_down_menu.dart';
import 'package:app_translate/presenter/components/translate_box.dart';
import 'package:app_translate/presenter/components/translate_options.dart';
import 'package:app_translate/presenter/providers/languages_provider.dart';
import 'package:app_translate/presenter/providers/translate_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomeScreen extends ConsumerStatefulWidget {
   HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final languages = Language.values;

  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final sourceLanguage = ref.watch(sourceLanguageProvider);
    final targetLanguage = ref.watch(targetLanguageProvider);
    final translatedText = ref.watch(translateTextProvider);
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              spacing: 40,
              children: [
                TranslateOptions(languages),
                TranslateBox(
                  controller: controller,
                  onSubmitted: (text)async{
                    await ref.read(translateTextProvider.notifier).translate(TranslateTextParams(
                        textTranslate: controller.text,
                        sourceLanguage: sourceLanguage,
                        targetLanguage: targetLanguage));
                  },
                  icons: [
                    IconButton(
                      onPressed: ()async{
                       await TextToSpeechService.speak(
                         controller.text,
                         language: LanguageToCodeMapper.mapLanguageToCode(sourceLanguage),
                       );
                      },
                      icon: Icon(Icons.volume_up),
                    ),
                    IconButton(
                      onPressed: ()async{
                        await ClipboardService.copy(controller.text);
                      },
                      icon: Icon(Icons.copy),
                    ),
                    IconButton(
                      onPressed: (){
                        ref.invalidate(translateTextProvider);
                        controller.clear();
                      },
                      icon: Icon(Icons.add),
                    )
                  ],
                  labelText: "Escreva algo...",

                ),
              translatedText.whenOrNull(
                data: (data) => TranslateBox(
                  icons: [
                    IconButton(
                      onPressed: ()async{
                        await TextToSpeechService.speak(
                          data.translateTextEntity?.translatedText ?? "",
                          language: LanguageToCodeMapper.mapLanguageToCode(targetLanguage)
                        );
                      },
                      icon: Icon(Icons.volume_up),
                    ),
                    IconButton(
                      onPressed: (){
                        ref.invalidate(translateTextProvider);
                        controller.clear();
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                  labelText: "Tradução",
                  translatedText: data.translateTextEntity?.translatedText,
                  isTextField: false,
                ),
              ) ?? SizedBox.shrink(),

                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blueGrey)
                  ),
                  onPressed: (){
                    ref.read(translateTextProvider.notifier).translate(TranslateTextParams(
                        textTranslate: controller.text,
                        sourceLanguage: sourceLanguage,
                        targetLanguage: targetLanguage));
                  },
                  child: Text("Traduzir"),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

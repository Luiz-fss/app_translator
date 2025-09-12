import 'package:app_translate/domain/helpers/language.dart';
import 'package:app_translate/domain/repositories/translate_text_repository.dart';
import 'package:app_translate/presenter/components/custom_drop_down_menu.dart';
import 'package:app_translate/presenter/components/translate_box.dart';
import 'package:app_translate/presenter/components/translate_options.dart';
import 'package:app_translate/presenter/providers/languages_provider.dart';
import 'package:app_translate/presenter/providers/translate_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
   HomeScreen({super.key});

  final languages = Language.values;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final sourceLanguage = ref.watch(sourceLanguageProvider);
    final targetLanguage = ref.watch(targetLanguageProvider);
    final translatedText = ref.watch(translateTextProvider);
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 40,
            children: [
              TranslateOptions(languages),
              TranslateBox(
                controller: controller,
                icons: [
                  Icon(Icons.volume_up),
                  Icon(Icons.copy),
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
                data: (data)=> TranslateBox(
                  icons: [
                    Icon(Icons.volume_up),
                    Icon(Icons.copy),
                  ],
                  labelText: "Tradução",
                  translatedText: data.translateTextEntity?.translatedText,
                  isTextField: false,
                ),

              )!,

              Flexible(
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blueGrey)
                  ),
                  onPressed: (){
                    ref.read(translateTextProvider.notifier).translate(TranslateTextParams(
                        textTranslate: controller.text,
                        sourceLanguage: sourceLanguage,
                        targetLanguage: targetLanguage));
                  },
                  child: Text("Traduzir"),),
              )

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/helpers/language.dart';
import '../providers/languages_provider.dart';
import 'custom_drop_down_menu.dart';

class TranslateOptions extends ConsumerWidget {
   TranslateOptions(this.languages, {super.key});

  final List<Language> languages ;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sourceLanguage = ref.watch(sourceLanguageProvider);
    final targetLanguage = ref.watch(targetLanguageProvider);
    return  ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ColoredBox(
        color: Colors.blueGrey ,
        child: Row(
          children: [
            CustomDropDownMenu(
              onSelected: (lang){
                ref.read(sourceLanguageProvider.notifier).state = lang!;
              },
              languages: languages,
              initialSelection: sourceLanguage,
            ),
            Icon(Icons.arrow_forward,color: Colors.white,),
            CustomDropDownMenu(
              onSelected: (lang){
                ref.read(targetLanguageProvider.notifier).state = lang!;
              },
              languages: languages,
              initialSelection: targetLanguage,
            )
          ],
        ),
      ),
    );
  }
}

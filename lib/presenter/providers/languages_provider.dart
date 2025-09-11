

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/helpers/language.dart';

final sourceLanguageProvider = StateProvider<Language>((ref){
  return Language.portuguese;
});


final targetLanguageProvider = StateProvider<Language>((ref){
  return Language.english;
});
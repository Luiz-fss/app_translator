
import 'package:app_translate/infrastructure/services/message_service.dart';
import 'package:clipboard/clipboard.dart';

class ClipboardService {

  static Future<void> copy (String text)async{
   if(text.isEmpty){
     return;
   }
   FlutterClipboard.copy(text).then((value){
     MessageService.showMessage(text);
   });
  }
}
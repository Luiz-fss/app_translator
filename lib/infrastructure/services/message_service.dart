import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageService {
  static showMessage(String message, {Color color = Colors.grey}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      fontSize: 26,
      backgroundColor: color
    );
  }
}

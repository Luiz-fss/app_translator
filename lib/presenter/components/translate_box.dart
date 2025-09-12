import 'package:flutter/material.dart';

class TranslateBox extends StatelessWidget {
  const TranslateBox({
    super.key,
    required this.icons,
    this.onChanged,
    this.onSubmitted,
    this.labelText,
    this.translatedText,
    this.isTextField = true,
    this.controller,
  });

  final List<Widget> icons;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? labelText;
  final String? translatedText;
  final bool isTextField;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          isTextField
              ? TextField(
                  maxLines: 6,
                  onChanged: onChanged,
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: labelText,
                    alignLabelWithHint: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  textInputAction: TextInputAction.done,
                  onSubmitted: onSubmitted,
                )
              : Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(translatedText??"Tradução"),
              ),
          Spacer(),
          Divider(indent: 10, endIndent: 10),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: icons),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

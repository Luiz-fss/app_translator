import 'package:flutter/material.dart';

class TranslateBox extends StatelessWidget {
  const TranslateBox({super.key, required this.icons, this.onChanged, this.onSubmitted, required this.labelText});

  final List<Icon> icons;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          TextField(
            maxLines: 6,
            onChanged: onChanged,
            controller: TextEditingController(),
            decoration: InputDecoration(
              labelText: labelText,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              )
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: onSubmitted,
          ),
          Spacer(),
          Divider(
            indent: 10,endIndent: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: icons,
          ),
          SizedBox(height: 10,)

        ],
      ),
    );
  }
}

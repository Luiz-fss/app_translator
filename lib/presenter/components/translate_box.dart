import 'package:flutter/material.dart';

class TranslateBox extends StatelessWidget {
  const TranslateBox({super.key, required this.icons});

  final List<Icon> icons;

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            maxLines: 6,
            onChanged: (value){},
            controller: TextEditingController(),
            decoration: InputDecoration(
              labelText: "Escreva algo",
              floatingLabelAlignment: FloatingLabelAlignment.start,
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              )
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: (s){},
          ),
          Spacer(),
          Divider(
            indent: 10,endIndent: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: icons,
          )

        ],
      ),
    );
  }
}

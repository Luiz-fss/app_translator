import 'package:flutter/material.dart';

class TranslateBox extends StatelessWidget {
  const TranslateBox({super.key, required this.icons});

  final List<Icon> icons;

  @override
  Widget build(BuildContext context) {
    return               Expanded(
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              maxLength: 6,
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
      ),
    );
  }
}

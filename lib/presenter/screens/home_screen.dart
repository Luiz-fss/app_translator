import 'package:app_translate/presenter/components/custom_drop_down_menu.dart';
import 'package:app_translate/presenter/components/translate_box.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 40,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ColoredBox(
                  color: Colors.blueGrey ,
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomDropDownMenu(
                          onSelected: (value){},
                          languages: [
                            "Portuguese","English"
                          ],
                          initialSelection: "Portuguese",
                        ),
                      ),
                      Icon(Icons.arrow_forward,color: Colors.white,),
                      Flexible(
                        child: CustomDropDownMenu(
                          onSelected: (value){},
                          languages: [
                            "Portuguese","English"
                          ],
                          initialSelection: "English",
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TranslateBox(
                icons: [
                  Icon(Icons.volume_up),
                  Icon(Icons.copy),
                  Icon(Icons.delete)
                ],
                labelText: "Escreva algo...",
              ),
              TranslateBox(
                icons: [
                  Icon(Icons.volume_up),
                  Icon(Icons.copy),
                ],
                labelText: "Escreva algo...",
              ),
              
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueGrey)
                ),
                onPressed: (){},
                child: Text("Traduzir"),)

            ],
          ),
        ),
      ),
    );
  }
}

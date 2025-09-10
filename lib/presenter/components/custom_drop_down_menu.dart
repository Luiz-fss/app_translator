import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.onSelected,
    required this.languages,
    this.initialSelection,
  });

  final void Function(String?)? onSelected;
  final List<String> languages;
  final String? initialSelection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownMenu(
        dropdownMenuEntries: languages
            .map(
              (language) => DropdownMenuEntry(value: language, label: language),
            )
            .toList(),
        onSelected: onSelected,
        initialSelection: initialSelection,
        selectedTrailingIcon: Icon(Icons.arrow_drop_up, color: Colors.white),
        trailingIcon: Icon(Icons.arrow_drop_down, color: Colors.white),
        menuStyle: MenuStyle(alignment: Alignment.center),
        textAlign: TextAlign.center,
        textStyle: TextStyle(color: Colors.white),
        inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
      ),
    );
  }
}

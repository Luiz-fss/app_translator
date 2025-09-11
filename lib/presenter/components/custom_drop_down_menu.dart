import 'package:app_translate/domain/helpers/language.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.onSelected,
    required this.languages,
    this.initialSelection,
  });

  final void Function(Language?)? onSelected;
  final List<Language> languages;
  final Language? initialSelection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownMenu(
          dropdownMenuEntries: languages
              .map(
                (language) => DropdownMenuEntry(value: language, label: language.name.toUpperCase()),
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
      ),
    );
  }
}

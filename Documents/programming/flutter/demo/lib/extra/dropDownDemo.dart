import 'package:flutter/material.dart';

class DropDownDemo extends StatefulWidget {
  const DropDownDemo({super.key});

  @override
  State<DropDownDemo> createState() => _MyWidgetState();
}

const List<String> list = ["Admin", "Member", "Employee", "New"];

class _MyWidgetState extends State<DropDownDemo> {
  String dropDownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: dropDownValue,
      onSelected: (String? value) {
        setState(() {
          dropDownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
      
    );
  }
}

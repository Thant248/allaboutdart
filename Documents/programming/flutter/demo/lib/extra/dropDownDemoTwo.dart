import 'package:demo/navigate/Admin.dart';
import 'package:demo/navigate/Employee.dart';
import 'package:demo/navigate/Member.dart';
import 'package:flutter/material.dart';

class Demo2 extends StatefulWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  State<Demo2> createState() => _MyWidgetState();
}

const List<String> list = ["Channels", "Admin", "Employee", "Member", "Add"];

class _MyWidgetState extends State<Demo2> {
  var dropDownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropDownValue,
      icon: _getIconForValue(dropDownValue),
      iconSize: 12,
      onChanged: (String? value) {
        setState(() {
          dropDownValue = value!;
          _navigateToPage(context, value);
        });
      },
      items: list.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  Icon _getIconForValue(String value) {
    switch (value) {
      case "Admin":
        return const Icon(Icons.admin_panel_settings_outlined);
      case "Employee":
        return const Icon(Icons.man);
      case "Member":
        return const Icon(Icons.memory);
      case "Channels":
        return const Icon(Icons.wifi_channel);
      case "Add":
        return const Icon(Icons.add);
      default:
        throw Exception('Icon not found for value: $value');
    }
  }

  void _navigateToPage(BuildContext context, String selectedItem) {
    switch (selectedItem) {
      case "Admin":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Admin(),
          ),
        );
        break;
      case "Employee":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Employee()),
        );
        break;
      case "Member":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const  Member()),
        );
        break;
      case "Add":

      default:
        throw Exception('Page not found for value: $selectedItem');
    }
  }
}

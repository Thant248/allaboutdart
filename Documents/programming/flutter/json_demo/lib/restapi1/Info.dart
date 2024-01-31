import 'package:flutter/material.dart';
import 'package:json_demo/restapi1/School.dart';

class SchoolInfoWidget extends StatelessWidget {

  
  Map<String, dynamic> _school = {
    "name": "IIT Kharagpur",
    "address": {"city": "Kharagpur", "state": "West Bengal"},
    "departments": [
      {"name": "Computer Science", "seats": 50},
      {"name": "Electronics", "seats": 70},
      {"name": "Electrical", "seats": 80},
      {"name": "Mechanical", "seats": 100},
    ]
  };

  @override
  Widget build(BuildContext context) {
    School schoolInfo = School.fromJson(_school);
    return ListView(
        children: List.generate(schoolInfo.departments!.length, (index) {
      return Container(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
          child: Text("Name: " +
              schoolInfo.departments![index].name.toString() +
              "\n" "Seats: " +
              schoolInfo.departments![index].seats.toString()));
    }));
  }
}

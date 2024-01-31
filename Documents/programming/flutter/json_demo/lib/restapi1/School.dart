
import 'package:json_demo/restapi1/Address.dart';
import 'package:json_demo/restapi1/Dapartement.dart';

class School {
 
  String? name;
  Address? address;
  List<Department>? departments;
 
  School({
    this.name,
    this.address,
    this.departments
  });
 
  static fromJson(Map<String, dynamic> map){
    return School(
        name: map['name'],
        address : Address.fromJson(map['address']),
        departments : Department.listFromJson(map['departments'])
    );
  }
}
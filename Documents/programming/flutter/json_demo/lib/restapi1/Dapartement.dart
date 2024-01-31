class Department {
  String? name;
  int? seats;
 
  Department({
    this.name,
    this.seats
  });
 
  static listFromJson(List<Map<String, dynamic>> list) {
    List<Department> departments = [];
    for (var value in list) {
      departments.add(Department.fromJson(value));
    }
    return departments;
  }
 
  static fromJson(Map<String, dynamic> parsedJson){
    return Department(
        name: parsedJson["name"],
        seats: parsedJson["seats"]
    );
  }
 
}
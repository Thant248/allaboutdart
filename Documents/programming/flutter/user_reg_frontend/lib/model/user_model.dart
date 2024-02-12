class User {
  int? id;
  String? fname;
  String? lname;
  int? age;
  String? email;
  String? phone;
  String? address;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.fname,
      this.lname,
      this.age,
      this.email,
      this.phone,
      this.address,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    age = json['age'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['age'] = this.age;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

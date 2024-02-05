class Job {
  String? name;
  String? age;
  String? job;
  String? id;

  Job({required this.name,required this.age,required this.job, this.id});

  Job.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    job = json['job'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['job'] = this.job;
    data['id'] = this.id;
    return data;
  }
}
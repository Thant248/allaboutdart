class DirectStar {
  String? id;
  String? directmsg;
  String? name;

   DirectStar({
     this.id,
     this.directmsg,
     this.name
  });
   DirectStar.fromJson(Map<String,dynamic> json){
    id = json['id'];
    directmsg = json['directmsg'];
    name  = json ['name'];
   }
   Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['directmsg'] = this.directmsg;
    data ['name'] = this.name;
    return data;
   }

}
class DirectThread {
  final int id;
  final String directthreadmsg;
  final String name;

  const DirectThread({
    required this.id,
    required this.directthreadmsg,
    required this.name
});
factory DirectThread.fromJson(Map<String,dynamic>json){
  return DirectThread(
    id: json ['id'], 
    directthreadmsg: json['directthreadmsg'], 
    name: json['name']);
}
}
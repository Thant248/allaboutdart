class GroupThreadMessage {
  List<gpThreads>? GpThreads;
  GroupThreadMessage({this.GpThreads});
  GroupThreadMessage.fromJson(Map<String, dynamic> json) {
    if (json['retrieveGroupThread']['t_group_threads'] != null) {
      GpThreads = <gpThreads>[];
      json['retrieveGroupThread']['t_group_threads'].forEach((v) {
        GpThreads!.add(new gpThreads.fromJson(v));
      });
    }  
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.GpThreads != null) {
      data['retrieveGroupThread']['t_group_threads'] =
          this.GpThreads!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}


class gpThreads {
  String? name;
  String? groupthreadmsg;
  String? created_at;
   gpThreads({
     this.groupthreadmsg,
     this.name,
     this.created_at
  });
   gpThreads.fromJson(Map<String,dynamic> json){
    name  = json ['name'];
    groupthreadmsg = json['groupthreadmsg'];
    created_at  = json ['created_at'];
   }
   Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['created_at'] = this.created_at;
    data['groupthreadmsg'] = this.groupthreadmsg;
    data ['name'] = this.name;
    return data;
   }
}
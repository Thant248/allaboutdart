import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/services/mentionlistsService/mention_lists_service.dart';


class MentionLists extends StatelessWidget {
  const MentionLists({super.key});

  @override
  Widget build(BuildContext context) {
    MentionListsService mentionListsService = MentionListsService();
    return Scaffold(
      backgroundColor: kPriamrybackground,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(136, 55, 71, 133),
        leading: IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.arrow_back,color: Colors.white)),
          title: Text("Mention Lists",style: TextStyle(fontSize: 20,color: Colors.white)),
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: Text("Group Mention",style: TextStyle(color: Colors.white),),
            children: [
              Container(
                height: 300,
                child: FutureBuilder(
                  future: mentionListsService.mentionList(),
                   builder: (context,snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                       } else if (snapshot.hasError){
                        return Text('Error:${snapshot.error}');
                       }else if(snapshot.hasData){
                        return Text('No data avaliable');
                       }else {
                        return ListView.builder(
                          itemCount: snapshot.data!.groupMessage!.length,
                          itemBuilder: (context,index){
                            final mentionItem = snapshot.data!.groupMessage![index];
                            return ListTile(
                              leading: Container(
                                height: 30,
                                width: 30,
                                color:Color.fromRGBO(244, 159, 28, 1),
                                child: Center(child: Text("index",style:TextStyle(color: Colors.white))),
                              ),
                              title: Text('${mentionItem.name?? ''}',
                              style: TextStyle(color: Colors.black,fontSize: 17),
                              ),
                              subtitle: Text(
                                '${mentionItem.groupmsg ?? ''}\n${mentionItem.channelName?? ''}\n${mentionItem.createdAt ?? ''}',
                              style: TextStyle(color: Colors.black,fontSize: 13),
                            ),

                              );
                            
                          }
                          );
                       }
                   }
                   ),
                
              
            )
            ],
            ),
           ExpansionTile(
            title: Text("Group Thread Mention",style: TextStyle(color: Colors.white),),
            children: [
              Container(
                height: 300,
                child: FutureBuilder(
                  future: mentionListsService.mentionList(),
                   builder: (context,snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                       } else if (snapshot.hasError){
                        return Text('Error:${snapshot.error}');
                       }else if(snapshot.hasData){
                        return Text('No data avaliable');
                       }else {
                        return ListView.builder(
                          itemCount: snapshot.data!.groupThread!.length,
                          itemBuilder: (context,index){
                            final mentionItem = snapshot.data!.groupThread![index];
                            return ListTile(
                              leading: Container(
                                height: 30,
                                width: 30,
                                color:Color.fromRGBO(244, 159, 28, 1),
                                child: Center(child: Text("index",style:TextStyle(color: Colors.white))),
                              ),
                              title: Text('${mentionItem.name?? ''}',
                              style: TextStyle(color: Colors.black,fontSize: 17),
                              ),
                              subtitle: Text(
                                '${mentionItem.groupthreadmsg ?? ''}\n${mentionItem.channelName?? ''}\n${mentionItem.createdAt ?? ''}',
                              style: TextStyle(color: Colors.black,fontSize: 13),
                            ),

                              );
                            
                          }
                          );
                       }
                   }
                   ),
                
              
            )
            ],
            ),
        ],

      ),

    );
  }
}

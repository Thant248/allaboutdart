import 'package:flutter/material.dart';
import 'package:flutter_frontend/model/StarLists.dart';
import 'package:intl/intl.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/starlistsService/star_lists_service.dart';

class DirectStars extends StatefulWidget {
  const DirectStars({Key? key}) : super(key: key);

  @override
  State<DirectStars> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DirectStars> {
  StarListService starListService = StarListService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: starListService.starList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProgressionBar(
                  imageName: 'loading.json', height: 200, size: 200,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else if (snapshot.data == null ||
                  snapshot.data!.directStar == null ||
                  snapshot.data!.directStar!.isEmpty) {
                return const ProgressionBar(imageName: 'dataSending.json', height: 200, size: 200,);
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.directStar!.length,
                        itemBuilder: (context, index) {
                          final starItem = snapshot.data!.directStar![index];
                          String dateFormat = starItem.createdAt.toString();
                          DateTime dateTime = DateTime.parse(dateFormat);
                           String time = DateFormat('yyyy-MM-dd').format(dateTime);
                          return ListTile(
                            title: Text(
                              '${starItem.name ?? ''}\n${starItem.directmsg ?? ''}\n${time}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

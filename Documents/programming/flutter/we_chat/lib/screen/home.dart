import 'package:flutter/material.dart';
import 'package:we_chat/api/apiservice.dart';
import 'package:we_chat/model/Post.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: FutureBuilder<List<Post>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;

            return ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, position) {
                // Handle the nullable title
                String title = posts![position].title ?? 'No title available';

                return getName(posts[position]);
                // Add more details if neede;
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
        future: ApiService(Dio()).getAllPosts(),
      ),
    );
  }

  Widget getName(Post post) {
    String? title = post.title;
    return ListTile(
      leading: Text("${post.userId}"),
      title: Text(title!),
      subtitle: Text(post.body!),
    );
  }
}

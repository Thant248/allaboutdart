import 'package:flutter/material.dart';
import 'package:user_reg_frontend/controller/user_api_service.dart';
import 'package:dio/dio.dart';
import 'package:user_reg_frontend/model/user_model.dart';
import 'package:user_reg_frontend/screen/post_screen.dart';
import 'package:user_reg_frontend/screen/search_screen.dart';
import 'package:user_reg_frontend/screen/update_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserApiService _userApiService = UserApiService(Dio());
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: const Text('User Information'),
        leading: const Icon(Icons.home_max),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PostScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildUserList();
      case 1:
        return SearchScreen();
      case 2:
        return const Text('School');
      default:
        return Container();
    }
  }

  Widget _buildUserList() {
    return FutureBuilder<List<User>>(
      future: _userApiService.getAllUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No Data Available'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              User user = snapshot.data![index];
              return ListTile(
                title: Text(user.address.toString()),
                leading: Text('${user.fname} ${user.lname}'),
                subtitle: Text(user.phone.toString()),
                trailing: PopupMenuButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onSelected: (value) {
                    if (value == "edit") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditScreen(
                                  user: snapshot!.data![index],
                                )),
                      );
                    } else if (value == "delete") {
                      _deleteUser(
                          int.parse(snapshot.data![index].id.toString()));
                    } else if (value == "search") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text("Edit"),
                      ),
                      const PopupMenuItem(
                        value: "delete",
                        child: Text("Delete"),
                      ),
                      const PopupMenuItem(
                          value: 'search', child: Text('Search'))
                    ];
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  Future<void> _deleteUser(int id) async {
    try {
      await _userApiService.deleteUser(id);
      // Refresh UI after deletion
      setState(() {});
    } catch (e) {
      print('Error Deleting user : $e');
    }
  }
}

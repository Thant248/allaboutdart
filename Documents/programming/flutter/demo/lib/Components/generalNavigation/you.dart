import 'package:demo/BottomNavigationBar.dart';
import 'package:demo/Components/generalNavigation/youNavigation/Invitations.dart';
import 'package:demo/Components/generalNavigation/youNavigation/Notification.dart';
import 'package:demo/Components/generalNavigation/youNavigation/PasueNoti.dart';
import 'package:demo/Components/generalNavigation/youNavigation/Preferences.dart';
import 'package:demo/Components/generalNavigation/youNavigation/Profile.dart';
import 'package:demo/Components/generalNavigation/youNavigation/SetStatus.dart';
import 'package:flutter/material.dart';

class You extends StatefulWidget {
  const You({super.key});

  @override
  State<You> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<You> {
  bool condition = true;
  _click() {
    setState(() {
      condition = !condition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/profile.jpg"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.8, 10, 6, 10),
                child: ElevatedButton(
                  onPressed: () {
                    _click();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: condition ? Colors.green : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: const Size(5, 5),
                    minimumSize: Size(3, 3), // Set the minimum size here
                  ),
                  child: const Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 12.0,
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thant Sin',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Active"),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ButtonTheme(
                  minWidth: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetStatus(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.tag_faces_sharp),
                    style: const ButtonStyle(alignment: Alignment.centerLeft),
                    label: const Text('What is on Your Mind'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ButtonTheme(
                  minWidth: double.infinity,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Noti(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.notification_add_rounded),
                    style: const ButtonStyle(
                      alignment: Alignment.centerLeft,
                    ),
                    label: const Text('Pause Notifications'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ButtonTheme(
                  minWidth: double.infinity,
                  child: TextButton.icon(
                    onPressed: () {
                      _click(); // Toggle the condition
                    },
                    icon: const Icon(Icons.people),
                    style: const ButtonStyle(
                      alignment: Alignment.centerLeft,
                    ),
                    label: const Text('Set yourself as away'),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Invitations(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.build),
                        style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                        ),
                        label: const Text('Invitations to connect'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profile(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.man_2_sharp),
                        style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                        ),
                        label: const Text('View  Profile'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Notifications(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.phone_android),
                        style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                        ),
                        label: const Text('Notifications'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PreFerences(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.settings),
                        style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                        ),
                        label: const Text('Preferences'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigate(),
    );
  }
}

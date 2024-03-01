import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/screens/Login/login_screen.dart';
import 'package:flutter_frontend/screens/Navigation/changePw.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:slide_to_act/slide_to_act.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    String fName = SessionStore.sessionData!.currentUser!.name
        .toString()
        .characters
        .first
        .toUpperCase();
    String name = SessionStore.sessionData!.currentUser!.name.toString();
    String email = SessionStore.sessionData!.currentUser!.email.toString();
    String active =
        SessionStore.sessionData!.currentUser!.activeStatus.toString();
    String work =
        SessionStore.sessionData!.mWorkspace!.workspaceName.toString();
    return Scaffold(
        backgroundColor: kPriamrybackground,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Your Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                kPrimarybtnColor)),
                                    onPressed: () {},
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.amber,
                                      ),
                                      title: Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              kPrimarybtnColor)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangePassword(
                                                  email: email,
                                                )));
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.lock,
                                      color: Colors.amber,
                                    ),
                                    title: Text(
                                      "change Password",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ))
          ],
          backgroundColor: navColor,
        ),
        body: name.isEmpty ||
                email.isEmpty ||
                active.isEmpty ||
                work.isEmpty ||
                fName.isEmpty
            ? const ProgressionBar(
                imageName: 'nodatahasFounded.json', height: 500, size: 500)
            : SingleChildScrollView(
                child: GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.cyan,
                          child: const Center(
                              child: Icon(
                            Icons.person,
                            size: 300,
                          )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Stack(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Center(
                                      child: Text(
                                    fName,
                                    style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ))),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: active == 0
                                      ? Container(
                                          color: Colors.amber,
                                        )
                                      : Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 54, 244, 101),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ))
                            ],
                          ),
                          title: Text(
                            name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Container(
                                child: ListTile(
                                  leading: const Icon(Icons.email),
                                  title: Text(email,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: ListTile(
                                  leading: const Icon(Icons.work),
                                  title: Text(work,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                            width: 250,
                            child: SlideAction(
                              borderRadius: 12,
                              elevation: 0,
                              innerColor: Colors.deepPurple,
                              outerColor: Colors.deepPurple[200],
                              sliderButtonIcon: const Icon(
                                Icons.logout,
                                color: kPriamrybackground,
                              ),
                              text: 'Logout',
                              onSubmit: () async {
                                await AuthController().removeToken();
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                            ))
                      ],
                    ),
                  ),
                ),
              ));
  }
}

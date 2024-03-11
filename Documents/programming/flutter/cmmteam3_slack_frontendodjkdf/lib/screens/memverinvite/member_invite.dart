// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_frontend/componnets/Nav.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/screens/home/workspacehome.dart';
import 'package:flutter_frontend/services/memberinvite/MemberInvite.dart';

class MemberInvitation extends StatefulWidget {
  const MemberInvitation({Key? key}) : super(key: key);
  @override
  State<MemberInvitation> createState() => _MemberInvitationState();
}

class _MemberInvitationState extends State<MemberInvitation> {
  TextEditingController emailController = TextEditingController();
  String workSpaceName =
      SessionStore.sessionData!.mWorkspace!.workspaceName.toString();
  int channelLength = SessionStore.sessionData!.mChannels!.length.toInt();
  int? channelId;
  bool _isSendingEmail = false;

  late List<bool> selected;

  Future<void> _submitEmail(
      String email, int channelId, BuildContext context) async {
    try {
      // Set _isSendingEmail to true before sending email
      setState(() {
        _isSendingEmail = true;
      });
      await MemberInviteServices().memberInvite(email, channelId);
      // Navigate to home screen after successful invitation
      Navigator.pop(context);
    } catch (e) {
      // Handle errors here
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to send invitation. Please try again later.'),
        backgroundColor: Colors.red,
      ));
    } finally {
      // Set _isSendingEmail to false after email sending is complete
      setState(() {
        _isSendingEmail = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = List.generate(channelLength, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Nav(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Member Invitation',
          style: TextStyle(color: Colors.blueGrey),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.mail),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Invite to $workSpaceName',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 3)),
              height: 200,
              child: ListView.builder(
                itemCount: channelLength,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SessionStore
                            .sessionData!.mChannels![index].channelStatus!
                        ? const Icon(Icons.tag)
                        : const Icon(Icons.lock),
                    enableFeedback: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              selected[index] ? Colors.green : Colors.white)),
                      onPressed: () {
                        setState(() {
                          for (var i = 0; i < selected.length; i++) {
                            if (i != index) {
                              selected[i] = false;
                            }
                          }
                          channelId =
                              SessionStore.sessionData!.mChannels![index].id!;
                        });
                      },
                      child: Text(
                        SessionStore.sessionData!.mChannels![index].channelName
                            .toString(),
                        style: TextStyle(
                            color:
                                selected[index] ? Colors.green : Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Invite with Email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.email),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible:
                  _isSendingEmail, // Show loading indicator if email is being sent
              child: const Column(
                children: [
                  ProgressionBar(
                      imageName: 'dataSending.json', height: 100, size: 100),
                  SizedBox(height: 8.0),
                  Text('Sending email...'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Check if email is already being sent
                if (!_isSendingEmail) {
                  _submitEmail(emailController.text, channelId!, context);
                }
              },
              child: Text('Invite'),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_frontend/screens/Login/login_form.dart';
import 'package:flutter_frontend/services/confirmInvitation/confirm_member_invitation.dart';
import 'package:flutter_frontend/model/confirm.dart';
import 'package:flutter_frontend/services/confirmInvitation/confirm_invitation_service.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:dio/dio.dart';

class ConfirmPage extends StatelessWidget {
  final int? channelId;
  final String? email;
  final int? workspaceid;

  const ConfirmPage({Key? key, this.channelId, this.email, this.workspaceid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _apiSerive = MemberInvitation();

    String? name;
    String? password;
    String? confirmpassword;
    String? channelName;
    String? workspaceName;

    void _submitForm() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        try {
          _apiSerive.memberInvitationConfirm(
              password.toString(),
              confirmpassword.toString(),
              name.toString(),
              email!,
              channelName!,
              workspaceName!);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const LoginForm()));
        } catch (e) {
          print('Error confirming invitation: $e');
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Confirm Invitation')),
      body: FutureBuilder<Confirm>(
          future: ConfirmInvitationService(Dio(BaseOptions(headers: {"Content-type": "application/json", "Accept": "application/json"})))
              .getConfirmData(channelId!, email!, workspaceid!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ProgressionBar(
                  imageName: 'waiting.json', height: 200, size: 200);
            } else {
              var muser = snapshot.data;
              channelName = muser!.mUser!.profileImage;
              workspaceName = muser.mUser!.rememberDigest;
              return Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Channel nmae: $channelName'),
                      Text('Email: $email'),
                      Text('Workspace name: $workspaceName'),
                      SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          name = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Confirmation Code',
                          hintText: 'Enter the confirmation code',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the confirmation code';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Confirmation Code',
                          hintText: 'Enter the confirmation code',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the confirmation code';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          confirmpassword = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Confirmation Code',
                          hintText: 'Enter the confirmation code',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the confirmation code';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          _submitForm();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.amber),
                        ),
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}

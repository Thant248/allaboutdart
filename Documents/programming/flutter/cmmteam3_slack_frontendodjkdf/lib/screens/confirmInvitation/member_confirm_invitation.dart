import 'package:flutter/material.dart';
import 'package:flutter_frontend/screens/Login/login_form.dart';
import 'package:flutter_frontend/services/confirmInvitation/confirm_member_invitation.dart';
import 'package:flutter_frontend/services/memberinvite/MemberInvite.dart';

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

    String? _name;
    String? _password;
    String? _confirmpassword;

    void _submitForm() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        try {
          _apiSerive.memberInvitationConfirm(
              _password.toString(),
              _confirmpassword.toString(),
              _name.toString(),
              email!,
              channelId!,
              workspaceid!);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const LoginForm()));

          // Handle successful confirmation, navigate to another page, etc.
        } catch (e) {
          print('Error confirming invitation: $e');
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Confirm Invitation')),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Channel ID: $channelId'),
              Text('Email: $email'),
              Text('Workspace ID: $workspaceid'),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _name = value;
                },
                decoration: InputDecoration(
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
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _password = value;
                },
                decoration: InputDecoration(
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
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _confirmpassword = value;
                },
                decoration: InputDecoration(
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                   _submitForm();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                ),
                child: Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/screens/Login/login_form.dart';
import 'package:flutter_frontend/services/confirmInvitation/member_confim_invatition.dart';

class MemberConfirm extends StatefulWidget {
  final int channelId;
  final String email;
  final int workspaceid;
  const MemberConfirm(
      {super.key, required this.channelId, required this.email, required this.workspaceid,
    });

  @override
  State<MemberConfirm> createState() => _MemberConfirmState();
}

class _MemberConfirmState extends State<MemberConfirm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _apiservice = new MemberConfirmInvitation();
  String? _name;
  String? _password;
  String? _confirmPassword;

  void _submitForm() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      try {
        _apiservice.memberInvitationConfir(
            _password.toString(),
            _confirmPassword.toString(),
            _name.toString(),
            widget.channelId,
            widget.workspaceid,
            widget.email);

        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LoginForm()));

       
      } catch (e) {
        print('Error confirming invitation: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Member Confirmation'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Channel Id $widget.channelId'),
                Text('Email: $widget.email'),
                Text('WorkSpace ID: $widget.workspaceId'),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  onSaved: (name) {
                    _name = name;
                  },
                  decoration: const InputDecoration(
                    hintText: "Name",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.person),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your  Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  onSaved: (password) {
                    _password = password;
                  },
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.person),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  onSaved: (confirm) {
                    _confirmPassword = confirm;
                  },
                  decoration: const InputDecoration(
                    hintText: "Confirm Your Password",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.password),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your confirm Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber),
                  ),
                  child: const Text('Confirm Your Invitation'),
                ),
              ],
            )),
      ),
    );
  }
}

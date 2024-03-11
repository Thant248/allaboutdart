import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:goroute/service/confirm_serv.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Confirm Invitation'),
        ),
      ),
    );
  }
}

class ConfirmPage extends StatelessWidget {
  final int? channelId;
  final String? email;
  final int? workspaceid;

  const ConfirmPage({Key? key, this.channelId, this.email, this.workspaceid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _apiSerive = ApiSerices();

    String? _name;
    String? _password;
    String? _confirmpassword;

    void _submitForm() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        try {
          _apiSerive.confirmUser(
              _password.toString(),
              _confirmpassword.toString(),
              _name.toString(),
              email!,
              channelId!,
              workspaceid!);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomePage()));

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

final GoRouter _router = GoRouter(
  initialLocation: '/home', // Initial route
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/confirminvitation',
      builder: (context, state) {
        final channelId = int.tryParse(state.queryParams['channelid'] ?? '');
        final email = state.queryParams['email'];
        final workspaceid =
            int.tryParse(state.queryParams['workspaceid'] ?? '');
        return ConfirmPage(
          channelId: channelId,
          email: email,
          workspaceid: workspaceid,
        );
      },
    ),
  ],
);

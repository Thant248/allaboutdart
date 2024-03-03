import 'package:flutter/material.dart';

class ConfirmationForm extends StatelessWidget {
  final String channelId;
  final String email;
  final String workspaceId;

  ConfirmationForm({
    required this.channelId,
    required this.email,
    required this.workspaceId,
  });

  @override
  Widget build(BuildContext context) {
    // Implement your confirmation form UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Channel ID: $channelId'),
            Text('Email: $email'),
            Text('Workspace ID: $workspaceId'),
            // Add form fields and confirmation button here
          ],
        ),
      ),
    );
  }
}

class InvitationScreen extends StatelessWidget {
  final Map<String, String> queryParams;

  InvitationScreen({required this.queryParams});

  @override
  Widget build(BuildContext context) {
    String channelId = queryParams['channelid'] ?? '';
    String email = queryParams['email'] ?? '';
    String workspaceId = queryParams['workspaceid'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Invitation Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Channel ID: $channelId'),
            Text('Email: $email'),
            Text('Workspace ID: $workspaceId'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationForm(
                      channelId: channelId,
                      email: email,
                      workspaceId: workspaceId,
                    ),
                  ),
                );
              },
              child: Text('Proceed to Confirmation'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invitation Link Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/invite': (context) {
          Map<String, String> queryParams =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return InvitationScreen(queryParams: queryParams);
        },
        '/confirm': (context) {
          Map<String, String> queryParams =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return ConfirmationForm(
            channelId: queryParams['channelid'] ?? '',
            email: queryParams['email'] ?? '',
            workspaceId: queryParams['workspaceid'] ?? '',
          );
        },
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulating dynamic data from the confirmation link
            Map<String, String> confirmationData = {
              'channelid': '49',
              'email': 'thantsinphyoe18920@gmail.com',
              'workspaceid': '12'
            };
            Navigator.pushNamed(context, '/invite',
                arguments: confirmationData);
          },
          child: Text('Click to simulate Invitation Link Click'),
        ),
      ),
    );
  }
}

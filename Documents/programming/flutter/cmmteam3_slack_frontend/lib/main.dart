import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/screens/Welcome/welcome_screen.dart';
import 'package:flutter_frontend/screens/confirmInvitation/member_confirm_invitation.dart';
import 'package:flutter_frontend/services/directMessage/provider/direct_message_provider.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  // setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DirectMessageProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        builder: (_, child) => Portal(child: child!),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/', // Initial route
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
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

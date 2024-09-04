import 'package:bloc_provider/common/bloc/auth/auth_state.dart';
import 'package:bloc_provider/common/bloc/auth/auth_state_cubit.dart';
import 'package:bloc_provider/core/config/themes/app_theme.dart';
import 'package:bloc_provider/presentation/auth/pages/signup.dart';
import 'package:bloc_provider/presentation/home/pages/home.dart';
import 'package:bloc_provider/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black
    )
  );
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (context) => AuthStateCubit()..appStarted(),
        child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthStateCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return const HomePage();
              }
              if (state is UnAuthenticated) {
                return SignUpPage();
              }
              return Container();
            },
          ),
        ),
    );
  }
}
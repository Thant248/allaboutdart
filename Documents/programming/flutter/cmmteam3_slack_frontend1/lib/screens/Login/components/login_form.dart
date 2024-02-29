import 'package:flutter/material.dart';
import 'package:flutter_frontend/componnets/Nav.dart';
import 'package:flutter_frontend/componnets/already_have_an_account_acheck.dart';
import 'package:flutter_frontend/screens/SignUp/signup_screen.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';

import '../../../constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController workspaceController = TextEditingController();
    AuthController authController = AuthController();
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Your Name",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: workspaceController,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your WorkSpaceName",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.work),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () async {
              try {
                // Login user
                var token = await authController.loginUser(
                  nameController.text,
                  passwordController.text,
                  workspaceController.text,
                );
                // Navigate to UserInformation screen on successful login
                if (token != true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Nav(),
                    ),
                  );
                }
              } catch (e) {
                // Handle errors, e.g., display a snackbar with the error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login failed: $e'),
                  ),
                );
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(kPrimarybtnColor),
            ),
            child: Text("Login".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

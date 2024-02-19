import 'package:flutter/material.dart';
import 'package:flutter_frontend/componnets/already_have_an_account_acheck.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/controller/user_controller_service.dart';
import 'package:flutter_frontend/model/user_create.dart';
import 'package:flutter_frontend/screens/login/login_screen.dart';
import 'package:dio/dio.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    String? _rememberDigest,
        _profileImage,
        _name,
        _email,
        _password,
        _passwordConfirmation;

    void _submitForm() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        // Create a User instance with the entered data
        User user = User(
          rememberDigest: _rememberDigest,
          profileImage: _profileImage,
          name: _name,
          email: _email,
          password: _password,
          passwordConfirmation: _passwordConfirmation,
          admin: "1",
        );

        // Convert the User object to a Map<String, dynamic>
        Map<String, dynamic> userData = user.toJson();

        // Use the UserService to create a new user
        try {
          await UserService(Dio()).createUser(userData);
          // If the request is successful, navigate to the login screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } catch (e) {
          // Handle the error if the request fails
          print('Error creating user: $e');
        }
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (workSpaceName) {
              _rememberDigest = workSpaceName;
            },
            decoration: const InputDecoration(
              hintText: "WorkSpace Name",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a WorkSpace Name';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              onSaved: (channelName) {
                _profileImage = channelName;
              },
              decoration: const InputDecoration(
                hintText: "Channel Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Channel Name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
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
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {
                _email = email;
              },
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an Email';
                }
                // You can add more sophisticated email validation here if needed
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.none,
              obscureText: true,
              cursorColor: kPrimaryColor,
              onSaved: (password) {
                _password = password;
              },
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Password';
                }
                // You can add more sophisticated password validation here if needed
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              onSaved: (passwordConfirmation) {
                _passwordConfirmation = passwordConfirmation;
              },
              decoration: const InputDecoration(
                hintText: "Re-Enter Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

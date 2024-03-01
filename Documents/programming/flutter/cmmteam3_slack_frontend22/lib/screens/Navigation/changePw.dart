import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/screens/Navigation/profle.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';

class ChangePassword extends StatefulWidget {
  final String? email;

  const ChangePassword({Key? key, this.email}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late AuthController _authController;
  bool _isPasswordChanging = false;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _authController = AuthController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPriamrybackground,
      appBar: AppBar(
        backgroundColor: navColor,
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.email),
              title: Text("${widget.email}"),
            ),
            const SizedBox(height: 10),
            buildPasswordTextField(),
            const SizedBox(height: 10),
            buildConfirmPasswordTextField(),
            const SizedBox(height: 10),
            buildChangePasswordButton(),
          ],
        ),
      ),
    );
  }

  Widget buildPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: TextFormField(
        controller: _passwordController,
        textInputAction: TextInputAction.done,
        obscureText: !_passwordVisible,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Enter Your password",
          prefixIcon: const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Icon(Icons.lock),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
            icon: Icon(
                _passwordVisible ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ),
    );
  }

  Widget buildConfirmPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: TextFormField(
        controller: _confirmPasswordController,
        textInputAction: TextInputAction.done,
        obscureText: !_confirmPasswordVisible,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Confirm Your password",
          prefixIcon: const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Icon(Icons.lock),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _confirmPasswordVisible = !_confirmPasswordVisible;
              });
            },
            icon: Icon(_confirmPasswordVisible
                ? Icons.visibility_off
                : Icons.visibility),
          ),
        ),
      ),
    );
  }

  Widget buildChangePasswordButton() {
    return TextButton(
      onPressed: () async {
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Are You Sure want to update'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password Upgrading ..."),
                      duration: Duration(seconds: 4),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );

                  handleChangePassword();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const profile()));
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: const Text(
        "Change Password",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  void handleChangePassword() async {
    try {
      setState(() {
        _isPasswordChanging = true;
      });
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Your password doesn't match!"),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {},
            ),
          ),
        );
      } else {
        await _authController.changePassword(
          _passwordController.text,
          _confirmPasswordController.text,
        );
        // Disposing controllers after usage
        _passwordController.dispose();
        _confirmPasswordController.dispose();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Failed to change password'),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        _isPasswordChanging = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Password has been changed'),
        backgroundColor: Colors.green,
      ));
    }
  }
}

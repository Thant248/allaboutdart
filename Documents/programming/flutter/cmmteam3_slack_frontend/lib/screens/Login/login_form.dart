import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_frontend/componnets/Nav.dart';
import 'package:flutter_frontend/componnets/already_have_an_account_acheck.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/screens/SignUp/signup_screen.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:flutter_frontend/theme/app_color.dart';
import 'package:rive/rive.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool lookRight = false;
  bool lookLeft = false;

  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController workspaceController = TextEditingController();
  FocusNode workspaceFocusNode = FocusNode();
  AuthController authController = AuthController();

  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<double>? numLock;
  SMIInput<bool>? isHandsup;

  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workspaceFocusNode.addListener(workspaceFocus);
    nameFocusNode.addListener(nameFoucs);
    passwordFocusNode.addListener(passwordFocus);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    workspaceFocusNode.removeListener(workspaceFocus);
    nameFocusNode.removeListener(nameFoucs);
    passwordFocusNode.removeListener(passwordFocus);
  }

  void workspaceFocus() {
    isChecking?.change(workspaceFocusNode.hasFocus);
  }

  void nameFoucs() {
    isChecking?.change(nameFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsup?.change(passwordFocusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool _isLogin = false;

    return Scaffold(
      backgroundColor: const Color(0xFFD6E2EA),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Container(
              height: 64,
              width: 64,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: const Image(image: AssetImage("assets/images/slack.jpg")),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Welcome From Slack",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: RiveAnimation.asset("rives/polar.riv",
                  fit: BoxFit.fitHeight,
                  stateMachines: const ["Login Machine"], onInit: (artboard) {
                controller = StateMachineController.fromArtboard(
                    artboard, "Login Machine");
                if (controller == null) return;

                artboard.addController(controller!);
                isChecking = controller?.findInput("isChecking");
                numLock = controller?.findInput("numLock");
                isHandsup = controller?.findInput("isHandsUp");
                trigSuccess = controller?.findInput("trigSuccess");
                trigFail = controller?.findInput("trigfail");
              }),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextFormField(
                      onChanged: (value) {
                        numLock?.change(value.length.toDouble());
                      },
                      controller: nameController,
                      focusNode: nameFocusNode,
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
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextFormField(
                      onChanged: (value) {},
                      focusNode: passwordFocusNode,
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
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextFormField(
                      onChanged: (value) {
                        numLock?.change(value.length.toDouble());
                      },
                      focusNode: workspaceFocusNode,
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
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return WillPopScope(
                                  child: Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    backgroundColor: Colors.transparent,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 32),
                                            child: ProgressionBar(
                                                imageName: "loading.json",
                                                height: 150,
                                                size: 150),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onWillPop: () async => false);
                            },
                          );
                          workspaceFocusNode.unfocus();
                          passwordFocusNode.unfocus();
                          nameFocusNode.unfocus();

                          await AuthController().loginUser(
                              nameController.text,
                              passwordController.text,
                              workspaceController.text);
                          // ignore: use_build_context_synchronously
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const Nav()));
                        } catch (e) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                            "Login Failed",
                            style: TextStyle(color: Colors.red),
                          )));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPrimarybtnColor),
                      ),
                      child: Text("Login".toUpperCase()),
                    ),
                  ),
                  const SizedBox(height: 32),
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
            ),
          ],
        ),
      ),
    );
  }
}

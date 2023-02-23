/**
 * @author Daniel Alvarez
 * @email josamogax@gmail.com
 * @create date 2023-02-23 00:56:59
 * @modify date 2023-02-23 00:56:59
 * @desc [description]
 */

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:footer/footer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWebDesktop extends StatefulWidget {
  const LoginWebDesktop({super.key});

  @override
  State<LoginWebDesktop> createState() => _LoginWebDesktopState();
}

//...
class _LoginWebDesktopState extends State<LoginWebDesktop> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //...
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            //<-- Expanded widget
            child: Image.asset(
          'assets/images/flutter_logo.jpg',
          fit: BoxFit.cover,
        )),
        Expanded(
          //<-- Expanded widget
          child: Container(
            constraints: const BoxConstraints(maxWidth: 21),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome back!',
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Login to your account',
                  style: GoogleFonts.inter(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 35),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.email),
                            labelText: ("E-mail"),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your email'),
                        validator: (emailText) {
                          if (emailText == null ||
                              emailText.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailText)) {
                            return 'Enter a valid email.';
                          }
                          if (emailText.length < 5 &&
                              emailText.contains('@') &&
                              emailText.endsWith('.com')) {
                            return null;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            labelText: ("Password"),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your password'),
                        validator: (passwordText) {
                          if (passwordText == null || passwordText.isEmpty) {
                            return 'Password cannot be empty.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      Row(
                          //...
                          ),
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Successful login'),
                                content:
                                    const Text('You have successfully logged into your account.'),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white, // Text Color
                                    ),
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white, // Text Color
                        ),
                        child: const Text("Login"),
                        //...
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SignInButton(
                  Buttons.Google,
                  text: "Sign in with Google",
                  onPressed: () {},
                ),
                const SizedBox(height: 15),
                SignInButton(
                  Buttons.GitHub,
                  text: "Sign in with GitHub",
                  onPressed: () {},
                ),
                const SizedBox(height: 15),
                SignInButton(
                  Buttons.Facebook,
                  text: "Sign in with Facebook",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

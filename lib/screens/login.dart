/**
 * @author Daniel Alvarez
 * @email josamogax@gmail.com
 * @create date 2023-02-23 00:45:06
 * @modify date 2023-02-23 00:45:06
 * @desc [description]
 */

import 'package:flutter/material.dart';
import 'package:responsive_login/screens/login_mobile.dart';
import 'package:responsive_login/screens/login_tablet.dart';
import 'package:responsive_login/screens/login_webdesktop.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const LoginMobile();
          } else if (constraints.maxWidth > 600 && constraints.maxWidth < 900) {
            return const LoginTablet();
          } else {
            return const LoginWebDesktop();
          }
        },
      ),
    );
  }
}

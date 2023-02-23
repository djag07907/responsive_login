/**
 * @author Daniel Alvarez
 * @email josamogax@gmail.com
 * @create date 2023-02-23 03:40:49
 * @modify date 2023-02-23 03:40:49
 * @desc [description]
 */

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_login/screens/login_mobile.dart';
import 'package:responsive_login/screens/login_tablet.dart';
import 'package:responsive_login/screens/login_webdesktop.dart';
import 'package:url_launcher/url_launcher.dart';

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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        color: Colors.grey.shade200,
        items: <Widget>[
          GestureDetector(
            child: IconButton(
              tooltip: 'Daniel´s LinkedIn profile',
              color: const Color(0xFF0072b1),
              iconSize: 30.0,
              icon: const Icon(FontAwesomeIcons.linkedin),
              onPressed: () async {
                String url = 'https://www.linkedin.com/in/daniel-alvarez-b63858181/';
                // if (await launchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
                // } else {
                // throw 'Could not launch $url';
                // }
              },
            ),
          ),
          GestureDetector(
            child: IconButton(
              tooltip: 'Daniel´s GitHub profile',
              icon: const Icon(FontAwesomeIcons.github),
              color: const Color(0xFF171515),
              iconSize: 30.0,
              onPressed: () async {
                String url = 'https://github.com/djag07907';
                // if (await launchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
                // } else {
                // throw 'Could not launch $url';
                // }
              },
            ),
          ),
          GestureDetector(
            child: IconButton(
              tooltip: 'Daniel´s Whatsapp link',
              icon: const Icon(FontAwesomeIcons.whatsapp),
              color: const Color(0xFF25d366),
              iconSize: 30.0,
              onPressed: () async {
                var Whatsapp = '+50495301033';
                // String url = 'https://github.com/djag07907';
                // if (await launchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse('https://wa.me/$Whatsapp?text=Hi'));
                // } else {
                // throw 'Could not launch $url';
                // }
              },
            ),
          ),
          GestureDetector(
            child: IconButton(
              tooltip: 'Daniel´s Porftolio',
              icon: const Icon(FontAwesomeIcons.briefcase),
              color: const Color(0xFF808080),
              iconSize: 30.0,
              onPressed: () async {
                String url = 'https://djag07907.github.io/';
                // if (await launchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
                // } else {
                // throw 'Could not launch $url';
                // }
              },
            ),
          ),
        ],
        onTap: (index) {
          // TODO
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Want to login?'),
              content: const SelectableText(
                  'In order to log in, you can copy/paste the following credentials:\n\nEmail: test_email@djagdev.com\nPassword: myP4ssw0rd2023'),
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
        },
        child: const Icon(Icons.info),
      ),
    );
  }
}

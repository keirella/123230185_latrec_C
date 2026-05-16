import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';
import 'main_navigation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() =>
      _SplashPageState();
}

class _SplashPageState
    extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    checkLogin();
  }

  void checkLogin() async {

    SharedPreferences prefs =
        await SharedPreferences.getInstance();

    String? username =
        prefs.getString('username');

    Timer(
      const Duration(seconds: 2),
      () {

        if (username != null) {

          Get.offAll(
            () => MainNavigation(
              username: username,
            ),
          );

        } else {

          Get.offAll(
            () => LoginPage(),
          );

        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,

      body: const Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 100,
            ),

            SizedBox(height: 20),

            Text(
              "Toko Online",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
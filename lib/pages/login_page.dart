import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_navigation.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  final TextEditingController userCtrl =
      TextEditingController();

  final TextEditingController passCtrl =
      TextEditingController();

  final String myNIM = "123230185";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(

              children: [

                const Icon(
                  Icons.shopping_bag,
                  size: 100,
                  color: Colors.blue,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Login Toko Online",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: userCtrl,

                  decoration: InputDecoration(
                    labelText: "Username",

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: passCtrl,
                  obscureText: true,

                  decoration: InputDecoration(
                    labelText: "Password",

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(

                    onPressed: () async {

                      if (passCtrl.text == myNIM) {

                        SharedPreferences prefs =
                            await SharedPreferences
                                .getInstance();

                        await prefs.setString(
                          'username',
                          userCtrl.text,
                        );

                        Get.offAll(
                          () => MainNavigation(
                            username:
                                userCtrl.text,
                          ),
                        );

                      } else {

                        Get.snackbar(
                          "Error",
                          "Password wajib NIM",
                        );

                      }
                    },

                    child: const Text("Login"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
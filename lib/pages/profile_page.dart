import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class ProfilePage extends StatelessWidget {

  final String username;

  const ProfilePage({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Username: $username",

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Aplikasi toko online Flutter responsi IF-C.",
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: () async {

                  SharedPreferences prefs =
                      await SharedPreferences
                          .getInstance();

                  await prefs.remove('username');

                  Get.offAll(
                    () => LoginPage(),
                  );
                },

                child: const Text("Logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
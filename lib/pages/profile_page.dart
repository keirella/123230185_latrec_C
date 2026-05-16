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

        title: const Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: Center(

        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(25),

            child: Column(

              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                Container(

                  padding:
                      const EdgeInsets.all(5),

                  decoration: BoxDecoration(

                    shape: BoxShape.circle,

                    border: Border.all(
                      color:
                          const Color(0xFFFF5DA2),
                      width: 3,
                    ),

                    boxShadow: [

                      BoxShadow(
                        color: Colors.pink
                            .withOpacity(0.2),

                        blurRadius: 25,
                        offset:
                            const Offset(0, 10),
                      )
                    ],
                  ),

                  child: const CircleAvatar(

                    radius: 60,

                    backgroundColor:
                        Color(0xFFFFEEF5),

                    child: Icon(
                      Icons.person_rounded,
                      size: 70,
                      color: Color(0xFFFF5DA2),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Text(

                  username,

                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Container(

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(

                    color:
                        const Color(0xFFFFEEF5),

                    borderRadius:
                        BorderRadius.circular(
                      30,
                    ),
                  ),

                  child: const Text(

                    "Flutter Developer 💖",

                    style: TextStyle(
                      color: Color(0xFFFF5DA2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                Container(

                  width: double.infinity,

                  padding:
                      const EdgeInsets.all(25),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(
                      30,
                    ),

                    boxShadow: [

                      BoxShadow(
                        color: Colors.pink
                            .withOpacity(0.08),

                        blurRadius: 20,
                        offset:
                            const Offset(0, 10),
                      )
                    ],
                  ),

                  child: Column(

                    children: [

                      const Icon(
                        Icons.favorite_rounded,
                        color: Color(0xFFFF5DA2),
                        size: 40,
                      ),

                      const SizedBox(height: 15),

                      const Text(

                        "Terima kasih sudah mengadakan latres ✨",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(

                        "Semoga aku bisa maem enak dan minum es teh setelah responsi 🚀",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(

                  width: double.infinity,

                  child: ElevatedButton.icon(

                    onPressed: () async {

                      SharedPreferences prefs =
                          await SharedPreferences
                              .getInstance();

                      await prefs.remove(
                        'username',
                      );

                      Get.offAll(
                        () => LoginPage(),
                      );
                    },

                    icon: const Icon(
                      Icons.logout_rounded,
                    ),

                    label: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
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
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_time/extensions.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final String email = "";
  final String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 700.rs, // Adjust height to fit your design
            child: Image.network(
              "https://saathipads.com/cdn/shop/articles/3_Save_earth_Sustainable_Living_eco_friendly_lifestyle_habits_grow_green_save_the_planet_2048x.png?v=1642239276",
              fit: BoxFit.cover,
            ),
          ),
          // Card section
          Container(
            margin: EdgeInsets.only(top: 500.rs),
            height: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.rs),
                  topRight: Radius.circular(30.rs),
                ),
              ),
            ),
            padding: EdgeInsets.all(20.rs),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 10.rs,
                children: [
                  SizedBox(
                    height: 10.rs,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.rs),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30.rs),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "/questions");
                    },
                    style: ButtonStyle(
                      foregroundColor: const WidgetStatePropertyAll(Colors.white),
                      backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.rs),
                        ),
                      ),
                      minimumSize: WidgetStatePropertyAll(Size(double.infinity, 60.rs)),
                    ),
                    child: const Text("Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

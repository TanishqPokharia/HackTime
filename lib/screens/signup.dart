import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_time/extensions.dart';


final signUpLoadingProvider = StateProvider<bool>((ref) {
  return false;
});


class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
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
            height: 500.rs, // Adjust height to fit your design
            child: Image.network(
              "https://saathipads.com/cdn/shop/articles/3_Save_earth_Sustainable_Living_eco_friendly_lifestyle_habits_grow_green_save_the_planet_2048x.png?v=1642239276",
              fit: BoxFit.cover,
            ),
          ),
          // Card section
          Container(
            margin: EdgeInsets.only(top: 400.rs),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 20.rs,
                children: [
                  SizedBox(
                    height: 10.rs,
                  ),
                  Text("Start your emission free journey with EcoAI",style: context.textTheme.titleLarge,textAlign: TextAlign.start,),
                  SizedBox(height: 20.rs,),
                  TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.email),
                      hintText: "Email",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Password",
                      suffixIcon: Icon(Icons.password),
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
                    child: ref.watch(signUpLoadingProvider)?CircularProgressIndicator(color: Colors.white):const Text("Sign Up"),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign In",style: TextStyle(
                        decoration: TextDecoration.underline
                      ),),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

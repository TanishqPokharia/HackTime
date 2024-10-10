import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hack_time/extensions.dart';
import 'package:hack_time/screens/home.dart';
import 'package:hack_time/screens/navigation.dart';
import 'package:hack_time/screens/onboarding.dart';
import 'package:hack_time/screens/questions.dart';
import 'package:hack_time/screens/signup.dart';
import 'package:hack_time/secrets/secrets.dart';
import 'package:hack_time/utils/screen_height.dart';


final model = GenerativeModel(
  model: 'gemini-1.5-flash-latest',
  apiKey: geminiKey,
  systemInstruction: Content.system(systemInstruction)
);

void main() {

  runApp(const MyApp());
}

final getIt = GetIt.instance;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    getIt.registerFactory(()=>ScreenHeight(context.screenHeight));
  }
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.redHatDisplayTextTheme(
            ThemeData.light().textTheme,
          )
        ),
        initialRoute: "/onboarding",
        routes: {
          "/": (_)=> HomeScreen(),
          "/signUp" : (_) => SignupScreen(),
          "/onboarding": (_) => const OnboardingScreen(),
          "/questions": (_) => QuestionsScreen(),
          "/navigation": (_) => NavigationScreen()
        },
      ),
    );
  }
}



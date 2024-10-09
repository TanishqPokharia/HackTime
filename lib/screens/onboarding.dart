import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hack_time/extensions.dart';
import 'package:hack_time/widgets/onboarding_screen_list.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends HookWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(context.screenWidth, 200.rs), child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 80.rs,
          horizontal: 20.rs
        ),
        child: Row(
          children: [
            Text("Eco.AI",style: context.textTheme.titleLarge,)
          ],
        ),
      )),
      body: SafeArea(
        child: IntroductionScreen(
          pages: onboardingScreenList,
          done: Text("Done"),
          next: Text("Next",style: context.textTheme.titleLarge!.copyWith(color: Colors.green),),
          skip: Text("Skip",style: context.textTheme.titleLarge!.copyWith(color: Colors.green),),
          dotsDecorator: DotsDecorator(
            activeColor: Colors.green
          ),
          showSkipButton: true,
          onDone: (){
            Navigator.popAndPushNamed(context, "/signUp");
          },
        ),
      ),
    );
  }
}
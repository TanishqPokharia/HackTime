import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hack_time/extensions.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

final List<PageViewModel> onboardingScreenList = [
  PageViewModel(
    decoration: PageDecoration(
      bodyAlignment: Alignment.centerLeft,
      footerPadding: EdgeInsets.only(top: 100.rs),
      footerFit: FlexFit.tight
    ),
    titleWidget:  Text(
      "Your Personal Guide to a Sustainable Future in Healthcare.",
      textAlign: TextAlign.start,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28.rs),
    ),
    bodyWidget: Text(
      "Track, optimize, and reduce your environmental impact with AI-driven insights.",
      textAlign: TextAlign.start, // Align the body to start
      style: TextStyle(fontSize: 20.rs,color: Colors.grey.shade600,fontWeight: FontWeight.w600),
    ),
    image: Lottie.network("https://lottie.host/f5521ceb-7e25-4ab9-8823-d2c0bb17f692/jzeZmZLTLP.json"),
  ),
  PageViewModel(
    decoration: const PageDecoration(
      bodyAlignment: Alignment.centerLeft,
    ),
    titleWidget: Text(
      "Stay updated with real-time energy, waste, and resource usage data.",
      textAlign: TextAlign.start,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28.rs),
    ),
    bodyWidget: Text(
      "Make informed decisions with live sustainability metrics.",
      textAlign: TextAlign.start, // Align the body to start
      style: TextStyle(fontSize: 20.rs,color: Colors.grey.shade600,fontWeight: FontWeight.w600),
    ),
    image: Lottie.network("https://lottie.host/b817f45f-cf7a-41d7-ad63-cf29a7df04fb/aaatHEkHzY.json"),
  ),
  PageViewModel(
    decoration: const PageDecoration(
      bodyAlignment: Alignment.centerLeft,
    ),
    titleWidget: Text(
      "Our AI predicts your future resource consumption and provides personalized suggestions.",
      textAlign: TextAlign.start,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28.rs),
    ),
    bodyWidget: Text(
      "Discover how you can reduce energy, cut waste, and save costs.",
      textAlign: TextAlign.start, // Align the body to start
      style: TextStyle(fontSize: 20.rs,color: Colors.grey.shade600,fontWeight: FontWeight.w600),
    ),
    image: Lottie.network("https://lottie.host/901bf8bc-96d6-46e0-a746-23d8c7e1e770/chbAXGV09h.json"),
  ),
  PageViewModel(
    decoration: const PageDecoration(
      bodyAlignment: Alignment.centerLeft,
    ),
    titleWidget: Text(
      "Manage waste efficiently with guided segregation and recycling tips.",
      textAlign: TextAlign.start,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28.rs),
    ),
    bodyWidget: Text(
      "Reduce your hospital’s environmental footprint and help reduce carbon emissions.",
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 20.rs,color: Colors.grey.shade600,fontWeight: FontWeight.w600),
    ),
    image: Lottie.network("https://lottie.host/e056ddf2-b3f1-4555-ba79-219a41b24438/hcor2DOetJ.json"),
  ),
  PageViewModel(
    decoration: const PageDecoration(
      bodyAlignment: Alignment.centerLeft,
    ),
    titleWidget: Text(
      "Engage your staff with fun, gamified sustainability challenges.",
      textAlign: TextAlign.start,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28.rs),
    ),
    bodyWidget: Text(
      "Compete with peers and track your progress towards a greener future.",
      textAlign: TextAlign.start, // Align the body to start
      style: TextStyle(fontSize: 20.rs,color: Colors.grey.shade600,fontWeight: FontWeight.w600),
    ),
    image: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Lottie.network("https://lottie.host/acfb6eef-d994-4d71-8124-3f300d47d527/pAtKrsZIBP.json")),
        Flexible(child: Lottie.network("https://lottie.host/d5947d42-cc5a-40a8-ab59-77b8d0f3b3b3/XWZhzEQztL.json")),
      ],
    ),
  ),
];

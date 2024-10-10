import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_time/screens/challenges.dart';
import 'package:hack_time/screens/community.dart';
import 'package:hack_time/screens/home.dart';
import 'package:hack_time/screens/impact.dart';
import 'package:hack_time/screens/rewards.dart';

final selectedIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class NavigationScreen extends ConsumerWidget {
  NavigationScreen({super.key});

  final List<TabItem> tabs = [
    const TabItem(icon: Icons.home_rounded, title: "Home", key: "0"),
    const TabItem(icon: Icons.emoji_events, title: "Rewards", key: "1"),
    const TabItem(icon: Icons.check_circle, title: "Challenges", key: "2"),
    const TabItem(icon: Icons.bar_chart, title: "Impact", key: "3"),
    const TabItem(icon: Icons.people_alt_outlined, title: "Community", key: "4"),
  ];

  final List<Widget> screens = const [
    HomeScreen(),
    RewardsScreen(),
    ChallengesScreen(),
    ImpactScreen(),
    CommunityScreen(),
  ];

  final List<String> appBarTitles = [
    "Home",
    "Rewards",
    "Challenges",
    "Impact",
    "Community Leaderboard",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current selected index
    int selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(appBarTitles[selectedIndex]), // Set title based on selected index
      ),
      bottomNavigationBar: BottomBarSalomon(
        items: tabs,
        duration: Durations.short4,
        curve: Curves.easeIn,
        onTap: (index) {
          ref.read(selectedIndexProvider.notifier).update((state) => index);
        },
        colorSelected: Colors.white,
        color: Colors.grey,
        indexSelected: selectedIndex,
        backgroundColor: Colors.white,
        backgroundSelected: Colors.green,
      ),
      body: screens[selectedIndex], // Update body based on selected index
    );
  }
}

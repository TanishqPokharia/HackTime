import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_time/extensions.dart';
import 'package:hack_time/screens/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImpactScreen extends ConsumerWidget {
  const ImpactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            height: 200.rs,
            margin: EdgeInsets.all(20.rs),
          ),
          Padding(
            padding: EdgeInsets.all(20.rs),
            child: const FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SavingsCard(icon: Icon(Icons.energy_savings_leaf_outlined,color: Colors.green,), title: "Carbon Saved", value: "250 kg"),
                  SavingsCard(icon: Icon(Icons.air_outlined,color: Colors.blue,), title: "Air Quality Improved", value: "15%")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

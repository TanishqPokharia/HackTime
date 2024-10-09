import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_time/extensions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.rs),
              child: Card(
                color: Colors.greenAccent.shade100.withOpacity(0.7),
                child: Padding(
                  padding: EdgeInsets.all(30.rs),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome back, Ashutosh !",style: context.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold
                          ),),
                          Text("Rank 7 of 1000")
                        ],
                      ),
                      Column(
                        spacing: 10.rs,
                        children: [
                          CircularPercentIndicator(
                            percent: 0.8,
                            radius: 30.rs,
                            animation: true,
                            animateFromLastPercent: true,
                            animationDuration: 1000,
                            progressColor: Colors.greenAccent,
                            backgroundColor: Colors.green.withOpacity(0.5),
                            center: Text("85"),
                          ),
                          Text("Your Eco Score")
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical:5.rs,horizontal: 20.rs),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SavingsCard(
                    icon: Icon(Icons.electric_bolt_outlined,color: Colors.blue,),
                    title: "Energy Saved",
                    value: "150 kWh",
                  ),
                  SavingsCard(icon: Icon(Icons.water_drop_outlined,color: Colors.blue,), title: "Water Saved", value: "1000L")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SavingsCard extends StatelessWidget {
  const SavingsCard({
    super.key, required this.icon, required this.title, required this.value,
  });

  final Icon icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: EdgeInsets.only(top: 30.rs,bottom: 30.rs,right: 80.rs,left: 30.rs),
        child: Column(
          spacing: 10.rs,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            Text(title),
            Text(value,style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_time/extensions.dart';


List<RewardData> rewards = [
  RewardData(title: "Reusable Water Bottle", sponsor: "GreenGear", points: "500"),
  RewardData(title: "Organic Cotton T-Shirt", sponsor: "EcoFashion", points: "750"),
  RewardData(title: "Solar Power Bank", sponsor: "NatureTech", points: "1000")
];

class RewardsScreen extends ConsumerWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        itemCount: rewards.length,
        padding: EdgeInsets.all(20.rs),
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.rs),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20.rs),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 30.rs,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rewards[index].title,style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),)
                            ,Text("by ${rewards[index].sponsor}",style: context.textTheme.titleSmall!.copyWith(color: Colors.grey),),
                          ],
                        ),
                        Text("${rewards[index].points} points",style: context.textTheme.titleMedium!.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    TextButton(onPressed: (){},
                        style: ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          backgroundColor: WidgetStatePropertyAll(Colors.green)
                        ),
                        child: Text("Redeem"))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class RewardData{
  final String title;
  final String sponsor;
  final String points;

  RewardData({required this.title, required this.sponsor, required this.points});
}
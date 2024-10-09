import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_time/extensions.dart';

final List<ChallengeData> challenges = [
    ChallengeData(
      title: "Zero Wastes Week",
      points: "100",
      progress: 70
    ),
    ChallengeData(
      title: "Bike to Work Month",
      points: "200",
      progress: 80
    ),

];

class ChallengesScreen extends ConsumerWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        itemCount: challenges.length,
        padding: EdgeInsets.all(20.rs),
        itemBuilder: (context,index){
          return ChallengeCard(data: challenges[index]);
        },
      ),
    );
  }
}

class ChallengeData {
  final String title;
  final double progress;
  final String points;

  ChallengeData({required this.title, required this.progress, required this.points});
}

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key, required this.data});

  final ChallengeData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.rs),
      child: Card(
        child: Padding(padding: EdgeInsets.all(20.rs),
        child: Column(
          spacing: 20.rs,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.title,style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold
                ),),
                Text("${data.points} points")
              ],
            ),
           LinearProgressIndicator(
             value: data.progress/100,
             color: Colors.green,
             minHeight: 10.rs,
             backgroundColor: Colors.green.withOpacity(0.5),
             borderRadius: BorderRadius.circular(20.rs),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("View Details",style: context.textTheme.titleMedium!.copyWith(
                   color: Colors.green
               ),),
               Text("${data.progress}%",style: context.textTheme.titleSmall!.copyWith(
                 color: Colors.green,
                 fontWeight: FontWeight.bold
               ),),
             ],
           ),

          ],
        ),
        ),
      ),
    );
  }
}

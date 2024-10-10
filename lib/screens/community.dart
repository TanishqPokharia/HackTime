import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_time/extensions.dart';

List<User> users = [
  User(name: "Alice", position: "1", points: "9000"),
  User(name: "Bob", position: "2", points: "8050"),
  User(name: "Charlie", position: "3", points: "7100"),
  User(name: "Diana", position: "4", points: "6200"),
  User(name: "Ethan", position: "5", points: "5000"),
  User(name: "Fiona", position: "6", points: "4500"),
  User(name: "George", position: "7", points: "4200"),
  User(name: "Hannah", position: "8", points: "4000"),
  User(name: "Isaac", position: "9", points: "3800"),
  User(name: "Jack", position: "10", points: "3600"),
  User(name: "Karen", position: "11", points: "3400"),
  User(name: "Liam", position: "12", points: "3200"),
  User(name: "Mia", position: "13", points: "3000"),
  User(name: "Noah", position: "14", points: "2800"),
  User(name: "Olivia", position: "15", points: "2600"),
  User(name: "Paul", position: "16", points: "2400"),
  User(name: "Quincy", position: "17", points: "2200"),
  User(name: "Rachel", position: "18", points: "2000"),
  User(name: "Sam", position: "19", points: "1800"),
  User(name: "Tina", position: "20", points: "1600"),
  User(name: "Umar", position: "21", points: "1500"),
  User(name: "Vera", position: "22", points: "1400"),
  User(name: "William", position: "23", points: "1300"),
  User(name: "Xander", position: "24", points: "1200"),
  User(name: "Yara", position: "25", points: "1100"),
  User(name: "Zane", position: "26", points: "1000"),
];


class CommunityScreen extends ConsumerWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        spacing: 30.rs,
        children: [
          SizedBox(
            height: 20.rs,
          ),
          Text("You rank 7 out of 1000"),
          Expanded(child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context,index){
                return ListTile(
                  tileColor: index==0? Color(0xFFD7A600):index==1?Colors.grey.shade300:index==2?Color(0xFFCD7F32):null,
                  leading: Text(users[index].position,style: context.textTheme.titleMedium,),
                  title: Text(users[index].name),
                  trailing: Text("${users[index].points} points",style: context.textTheme.titleSmall!.copyWith(
                    color: Colors.green
                  ),),
                );
            },
          ))
        ],
      ),
    );
  }
}

class User{
  final String name;
  final String position;
  final String points;

  User({required this.name, required this.position, required this.points});
}
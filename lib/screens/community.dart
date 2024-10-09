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
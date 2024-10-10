import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_time/extensions.dart';
import 'package:hack_time/providers/eco_ai_notifier_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

final sampleProvider = FutureProvider<bool>((ref) async {
  return Future.value(true);
});


final messagesProvider = StateProvider<List<ChatMessage>>((ref) {
  return [];
});

final typingProvider = StateProvider<List<ChatUser>>((ref) {
  return [];
});

final ChatUser ecoAI  = ChatUser(id: "2",firstName: "EcoAI");


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: const FittedBox(
                  child: Row(
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
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:30.rs,vertical: 10.rs),
                child: Text("Eco Advisor AI",style: context.textTheme.titleLarge,),
              ),
              Container(
                  height: 700.rs,
                  child: Card(
                margin: EdgeInsets.all(20.rs),
                child: DashChat(
                  currentUser: ChatUser(id: "1"), onSend: (message){
                      ref.read(messagesProvider.notifier).update((state)=>[message,...state]);
                      ref.read(ecoAiNotifierProvider.notifier).getEcoAiResponse(message.text);
                }, messages: ref.watch(messagesProvider),typingUsers: ref.watch(typingProvider),),
              ))
            ],
          ),
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

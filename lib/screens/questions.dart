import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hack_time/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionsScreen extends HookConsumerWidget {
  QuestionsScreen({super.key});

  final List<QuestionData> questions = [
    QuestionData(
      topic: "Transport",
      question: "Select the transport modes you use most frequently",
      options: const [
        SelectionCard(icon: Icon(Icons.directions_car, color: Colors.white), title: "Car", value: ""),
        SelectionCard(icon: Icon(Icons.directions_bus, color: Colors.white), title: "Bus", value: ""),
        SelectionCard(icon: Icon(Icons.people, color: Colors.white), title: "Carpool", value: ""),
        SelectionCard(icon: Icon(Icons.directions_walk, color: Colors.white), title: "Walk", value: ""),
        SelectionCard(icon: Icon(Icons.directions_bike, color: Colors.white), title: "Bike", value: ""),
      ],
    ),
    QuestionData(
      topic: "Energy",
      question: "Estimate your monthly energy usage",
      options: const [
        SelectionCard(icon: Icon(Icons.electric_bolt_outlined, color: Colors.white), title: "Low(<200 kWh)", value: ""),
        SelectionCard(icon: Icon(Icons.electric_bolt_outlined, color: Colors.white), title: "Medium(200-500 kWh)", value: ""),
        SelectionCard(icon: Icon(Icons.electric_bolt_outlined, color: Colors.white), title: "High(>500 kWh)", value: ""),
      ],
    ),
    QuestionData(
      topic: "Food",
      question: "What best describes your diet?",
      options: const [
        SelectionCard(icon: Icon(Icons.restaurant_outlined, color: Colors.white), title: "Meat heavy", value: ""),
        SelectionCard(icon: Icon(Icons.restaurant_outlined, color: Colors.white), title: "Balanced", value: ""),
        SelectionCard(icon: Icon(Icons.restaurant_outlined, color: Colors.white), title: "Vegetarian", value: ""),
        SelectionCard(icon: Icon(Icons.restaurant_outlined, color: Colors.white), title: "Vegan", value: ""),
      ],
    ),
    QuestionData(
      topic: "Shopping",
      question: "How often do you buy new non-food items?",
      options: const [
        SelectionCard(icon: Icon(Icons.shopping_bag_outlined, color: Colors.white), title: "Rarely", value: ""),
        SelectionCard(icon: Icon(Icons.shopping_basket_outlined, color: Colors.white), title: "Monthly", value: ""),
        SelectionCard(icon: Icon(Icons.shopping_cart_outlined, color: Colors.white), title: "Weekly", value: ""),
      ],
    ),
    QuestionData(
      topic: "Water Usage",
      question: "Estimate your daily water consumption",
      options: const [
        SelectionCard(icon: Icon(Icons.water_drop_outlined, color: Colors.white), title: "Low(<50L)", value: ""),
        SelectionCard(icon: Icon(Icons.water_drop_outlined, color: Colors.white), title: "Medium(50-100L)", value: ""),
        SelectionCard(icon: Icon(Icons.water_drop_outlined, color: Colors.white), title: "High(>100L)", value: ""),
      ],
    ),
  ];

  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final selectedOptions = useState<Map<String, String>>({});
    final selectedCards = useState<int?>(null); // Change to an int to hold the selected index

    return Scaffold(
      body: Stack(
        children: [
          // Background image and other UI elements
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 350.rs,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://cdni.iconscout.com/illustration/premium/thumb/eco-friendly-8455019-6666465.png"),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 340.rs),
            height: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.indigoAccent.shade400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.rs),
                  topRight: Radius.circular(30.rs),
                ),
              ),
            ),
            padding: EdgeInsets.all(30.rs),
            child: Column(
              spacing: 10.rs,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questions[selectedIndex.value].topic,
                  style: context.textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  questions[selectedIndex.value].question,
                  style: context.textTheme.titleMedium!.copyWith(color: Colors.white),
                ),
                Expanded(
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
                    children: questions[selectedIndex.value].options.asMap().entries.map((entry) {
                      int idx = entry.key;
                      SelectionCard card = entry.value;
                      return GestureDetector(
                        onTap: () {
                          log("Selected ${card.title}");
                          selectedOptions.value[questions[selectedIndex.value].topic] = card.title;
                          // Update the selected card index
                          selectedCards.value = idx;
                        },
                        child: SelectionCard(
                          icon: card.icon,
                          title: card.title,
                          value: card.value,
                          isSelected: selectedCards.value == idx, // Only the selected index is true
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (selectedIndex.value > 0) {
                          selectedIndex.value = selectedIndex.value - 1;
                          selectedCards.value = null; // Reset selection when going back
                        }
                      },
                      child: Text("Back", style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        log(selectedOptions.value.toString());
                        if (selectedIndex.value < questions.length - 1) {
                          selectedIndex.value = selectedIndex.value + 1;
                          selectedCards.value = null; // Reset selection when going to next question
                        }else{
                          Navigator.pushReplacementNamed(context, "/navigation");
                        }
                      },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                      child: Text("Next"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionData {
  final String topic;
  final String question;
  final List<SelectionCard> options;

  String get val => topic;

  QuestionData({required this.topic, required this.question, required this.options});
}

class SelectionCard extends StatelessWidget {
  const SelectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.isSelected = false,
  });

  final Icon icon;
  final String title;
  final dynamic value;

  final bool isSelected;

  String get val => title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.pink : Colors.blue.shade900.withOpacity(0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

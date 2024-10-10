import 'dart:developer';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hack_time/main.dart';
import 'package:hack_time/screens/home.dart';
import 'package:hack_time/screens/questions.dart';

class EcoAINotifier extends StateNotifier<void> {
  EcoAINotifier(this.ref) : super(());

  final Ref ref;

  void getEcoAiResponse(String message) async {
    ref.read(typingProvider.notifier).update((state)=>[...state,ecoAI]);
    final quizAnswers = ref.read(userChoicesProvider);
    log(quizAnswers.toString());
    final content = [Content.text("$message [user's carbon footprints are in this data ${quizAnswers.toString()}], take this into consideration while producing answers")];
    final response = await model.generateContent(content);
    ref.read(messagesProvider.notifier).update((state)=>[ChatMessage(user:ecoAI, createdAt: DateTime.now(),text: response.text??"Sorry, we are experiencing some trouble",isMarkdown: true),...state]);
    ref.read(typingProvider.notifier).update((state)=>[]);
  }


}

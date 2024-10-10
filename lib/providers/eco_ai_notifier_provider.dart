import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_time/notifiers/eco_ai_notifier.dart';

final ecoAiNotifierProvider = StateNotifierProvider<EcoAINotifier,void >((ref) {
  return EcoAINotifier(ref);
});

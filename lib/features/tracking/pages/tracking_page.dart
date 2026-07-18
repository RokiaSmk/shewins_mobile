import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cycle/providers/cycle_notifier.dart';
import '../symptom/providers/symptom_notifier.dart';
import '../emotion/providers/emotion_notifier.dart';
import '../food/providers/food_notifier.dart';

import '../../dashboard/widgets/cycle_card.dart';
import '../../dashboard/widgets/symptom_card.dart';
import '../../dashboard/widgets/emotion_card.dart';
import '../../dashboard/widgets/food_card.dart';

class TrackingPage extends ConsumerStatefulWidget {
  const TrackingPage({super.key});

  @override
  ConsumerState<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends ConsumerState<TrackingPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(_refreshTracking);
  }

  Future<void> _refreshTracking() async {
    await Future.wait([
      ref.read(cycleProvider.notifier).loadCycleProfile(),
      ref.read(cycleProvider.notifier).loadCycles(),
      ref.read(symptomProvider.notifier).loadMemberSymptoms(),
      ref.read(emotionProvider.notifier).loadMemberEmotions(),
      ref.read(foodProvider.notifier).loadMemberFoodJournals(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF8F5FA),
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Suivi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: RefreshIndicator(
        onRefresh: _refreshTracking,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Suivez l'évolution de votre santé au quotidien.",
                style: TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),

              SizedBox(height: 24),

              CycleCard(),

              SizedBox(height: 20),

              SymptomCard(),

              SizedBox(height: 20),

              EmotionCard(),

              SizedBox(height: 20),

              FoodCard(),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
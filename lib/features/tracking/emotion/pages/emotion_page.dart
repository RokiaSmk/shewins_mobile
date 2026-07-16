import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../providers/emotion_notifier.dart';
import '../widgets/emotion_tile.dart';

class EmotionPage extends ConsumerStatefulWidget {
  const EmotionPage({super.key});

  @override
  ConsumerState<EmotionPage> createState() =>
      _EmotionPageState();
}

class _EmotionPageState
    extends ConsumerState<EmotionPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(emotionProvider.notifier)
          .loadMemberEmotions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(emotionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal émotionnel"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutes.createEmotion);
        },
        child: const Icon(Icons.add),
      ),

      body: state.emotions.isEmpty
          ? const Center(
              child: Text(
                "Aucune émotion enregistrée.",
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.emotions.length,
              itemBuilder: (_, index) {
                return EmotionTile(
                  emotion: state.emotions[index],
                );
              },
            ),
    );
  }
}
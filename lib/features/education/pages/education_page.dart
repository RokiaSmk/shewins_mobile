import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../providers/education_notifier.dart';
import '../widgets/education_card.dart';
import '../../../core/constants/app_routes.dart';

class EducationPage extends ConsumerWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(educationProvider);

    final articles = state.contents.where((article) {
      final query = state.search.toLowerCase();

      return article.title.toLowerCase().contains(query) ||
          article.category.toLowerCase().contains(query) ||
          article.description.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FA),
      appBar: AppBar(
        title: const Text("Bibliothèque Santé"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(educationProvider.notifier).loadContents();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Apprenez à mieux comprendre votre santé",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Découvrez des articles pour mieux comprendre votre cycle menstruel, le SOPK, l'endométriose et adopter de bonnes habitudes au quotidien.",
              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            TextField(
              decoration: InputDecoration(
                hintText: "Rechercher un article...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                ref.read(educationProvider.notifier).search(value);
              },
            ),

            const SizedBox(height: 24),

            Expanded(
              child: Builder(
                builder: (_) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state.error != null) {
                    return Center(
                      child: Text(state.error!),
                    );
                  }

                  if (articles.isEmpty) {
                    return const Center(
                      child: Text(
                        "Aucun article disponible.",
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (_, index) {
                      final article = articles[index];

                      return EducationCard(
                        article: article,
                        onTap: () {
                          context.push(
                            AppRoutes.educationDetail,
                            extra: article,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/education_response.dart';
import '../utils/education_category_helper.dart';

class EducationDetailPage extends StatelessWidget {
  final EducationResponse article;

  const EducationDetailPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        EducationCategoryHelper.color(article.category);

    final icon =
        EducationCategoryHelper.icon(article.category);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FA),
      appBar: AppBar(
        title: const Text("Bibliothèque Santé"),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: color.withOpacity(.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 52,
                  color: color,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              article.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Chip(
              avatar: Icon(
                icon,
                color: color,
                size: 18,
              ),
              label: Text(article.category),
              backgroundColor:
                  color.withOpacity(.10),
            ),

            const SizedBox(height: 30),

            Text(
              article.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                height: 1.8,
              ),
            ),

            const SizedBox(height: 40),

            Container(
              padding:
                  const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withOpacity(.08),
                borderRadius:
                    BorderRadius.circular(18),
                border: Border.all(
                  color:
                      color.withOpacity(.25),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: color,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Conseil SheWins",
                        style: TextStyle(
                          color: color,
                          fontWeight:
                              FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "Les informations présentées dans cet article sont fournies à titre éducatif et ne remplacent pas une consultation médicale. Consultez toujours un professionnel de santé pour un diagnostic ou un traitement personnalisé.",
                    style: TextStyle(
                      color:
                          Colors.grey.shade800,
                      height: 1.6,
                    ),
                  ),

                  const Divider(height: 32),

                  Row(
                    children: [
                      Icon(
                        Icons.menu_book_outlined,
                        color: color,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Sources d'information",
                        style: TextStyle(
                          color: color,
                          fontWeight:
                              FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "Les contenus proposés dans SheWins sont élaborés à partir des recommandations d'organismes scientifiques reconnus (OMS, ACOG, ESHRE...) et sont régulièrement mis à jour afin de garantir une information fiable et accessible.",
                    style: TextStyle(
                      color:
                          Colors.grey.shade700,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              "Dernière mise à jour : "
              "${article.updatedAt.day.toString().padLeft(2, '0')}/"
              "${article.updatedAt.month.toString().padLeft(2, '0')}/"
              "${article.updatedAt.year}",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
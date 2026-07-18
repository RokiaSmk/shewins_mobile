import 'package:flutter/material.dart';

import '../../../core/widgets/app_card.dart';
import '../models/education_response.dart';
import '../utils/education_category_helper.dart';

class EducationCard extends StatelessWidget {
  final EducationResponse article;
  final VoidCallback onTap;

  const EducationCard({
    super.key,
    required this.article,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        EducationCategoryHelper.color(article.category);

    final icon =
        EducationCategoryHelper.icon(article.category);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: AppCard(
        title: article.title,
        subtitle: article.category,
        icon: icon,
        iconColor: color,
        onTap: onTap,
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
        ),
        child: Row(
          children: [
            Icon(
              Icons.menu_book_outlined,
              size: 18,
              color: color,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                article.description.length > 90
                    ? '${article.description.substring(0, 90)}...'
                    : article.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
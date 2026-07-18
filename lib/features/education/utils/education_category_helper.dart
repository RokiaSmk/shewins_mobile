import 'package:flutter/material.dart';

class EducationCategoryHelper {
  const EducationCategoryHelper._();

  static IconData icon(String category) {
    switch (category.toLowerCase()) {
      case 'sopk':
        return Icons.favorite_outline;

      case 'endométriose':
      case 'endometriose':
        return Icons.local_hospital_outlined;

      case 'cycle':
      case 'cycle menstruel':
        return Icons.calendar_month_outlined;

      case 'nutrition':
        return Icons.restaurant_outlined;

      case 'activité physique':
      case 'activite physique':
      case 'sport':
        return Icons.fitness_center_outlined;

      case 'sommeil':
        return Icons.bedtime_outlined;

      case 'stress':
      case 'santé mentale':
      case 'sante mentale':
        return Icons.self_improvement_outlined;

      case 'fertilité':
      case 'fertilite':
        return Icons.child_friendly_outlined;

      case 'grossesse':
        return Icons.pregnant_woman_outlined;

      case 'contraception':
        return Icons.health_and_safety_outlined;

      default:
        return Icons.menu_book_outlined;
    }
  }

  static Color color(String category) {
    switch (category.toLowerCase()) {
      case 'sopk':
        return Colors.pink;

      case 'endométriose':
      case 'endometriose':
        return Colors.red;

      case 'cycle':
      case 'cycle menstruel':
        return Colors.purple;

      case 'nutrition':
        return Colors.green;

      case 'activité physique':
      case 'activite physique':
      case 'sport':
        return Colors.orange;

      case 'sommeil':
        return Colors.indigo;

      case 'stress':
      case 'santé mentale':
      case 'sante mentale':
        return Colors.teal;

      case 'fertilité':
      case 'fertilite':
        return Colors.deepPurple;

      case 'grossesse':
        return Colors.blue;

      case 'contraception':
        return Colors.cyan;

      default:
        return Colors.pinkAccent;
    }
  }
}
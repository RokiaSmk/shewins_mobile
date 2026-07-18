import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // ========= DISPLAY =========

  static final heading = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static final titleLarge = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static final titleMedium = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static final titleSmall = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  // ========= BODY =========

  static final bodyLarge = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.grey,
  );

  static final bodyMedium = GoogleFonts.poppins(
    fontSize: 15,
    color: AppColors.grey,
  );

  static final bodySmall = GoogleFonts.poppins(
    fontSize: 13,
    color: AppColors.grey,
  );

  // ========= BUTTON =========

  static final button = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // ========= CAPTION =========

  static final caption = GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.grey,
  );

  // ========= COMPATIBILITÉ =========
  // Pour ne rien casser dans le code existant.

  static final title = titleMedium;
  static final body = bodyMedium;
}
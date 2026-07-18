import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar._();

  static const BorderRadius _radius =
      BorderRadius.all(Radius.circular(18));

  // Palette SheWins
  static const Color _primary = Color(0xFF9C6BFF);
  static const Color _success = Color(0xFF7B61FF);
  static const Color _error = Color(0xFFE57373);
  static const Color _warning = Color(0xFFFFB74D);
  static const Color _info = Color(0xFFBA68C8);

  static void _show({
    required BuildContext context,
    required String message,
    required IconData icon,
    required Color color,
    Duration duration = const Duration(seconds: 2),
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          duration: duration,
          content: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: _radius,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(.28),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.18),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 22,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  static void success(
    BuildContext context,
    String message,
  ) {
    _show(
      context: context,
      message: message,
      icon: Icons.check_circle_rounded,
      color: _success,
    );
  }

  static void error(
    BuildContext context,
    String message,
  ) {
    _show(
      context: context,
      message: message,
      icon: Icons.cancel_rounded,
      color: _error,
      duration: const Duration(seconds: 3),
    );
  }

  static void warning(
    BuildContext context,
    String message,
  ) {
    _show(
      context: context,
      message: message,
      icon: Icons.warning_amber_rounded,
      color: _warning,
    );
  }

  static void info(
    BuildContext context,
    String message,
  ) {
    _show(
      context: context,
      message: message,
      icon: Icons.info_rounded,
      color: _info,
    );
  }

  static void sheWins(
    BuildContext context,
    String message,
  ) {
    _show(
      context: context,
      message: message,
      icon: Icons.favorite_rounded,
      color: _primary,
    );
  }
}
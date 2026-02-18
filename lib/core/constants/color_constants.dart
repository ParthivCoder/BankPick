import 'package:bankpick/export.dart';

class AppColors {
  static const primaryBlue = Color(0xFF0066FF);
  static const white = Color(0xFFFFFFFF);
  static const mix = [Color(0xFF2E325A), Color(0xFF141629)];

  static Color getBgColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF121420)
          : const Color(0xFFF9F9FB);

  static Color getSecondaryBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1E2030)
          : const Color(0xFFFFFFFF);

  static Color getTextColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFFFFFFFF)
          : const Color(0xFF121420);

  static Color getTextGrey(BuildContext context) =>
      const Color(0xFF8E8E93);

  static Color getHintGrey(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF4E505F)
          : const Color(0xFFD1D1D6);
}
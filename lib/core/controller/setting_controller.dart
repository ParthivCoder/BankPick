import 'package:bankpick/export.dart';

class SettingsController extends GetxController {
  final RxBool isDarkMode = Get.isDarkMode.obs;
  final RxBool isBiometricEnabled = true.obs;

  void toggleTheme(bool val) {
    isDarkMode.value = val;
    Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleBiometric(bool val) {
    isBiometricEnabled.value = val;
  }

  void goToLanguage() => Get.to(() => const LanguagePage());
  void goToProfile() => Get.to(() => const ProfilePage());
  void goToContact() => Get.to(() => const ContactUsPage());
  void goToChangePassword() => Get.to(() => const ChangePasswordPage());
  void goToPrivacy() => Get.to(() => const PrivacyPolicyPage());
}
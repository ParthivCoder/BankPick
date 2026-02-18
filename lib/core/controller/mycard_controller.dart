import 'package:bankpick/export.dart';

class CardsController extends GetxController {
  final RxDouble spendingLimit = 0.46.obs;

  final List<Map<String, dynamic>> cardTransactions = [
    {"icon": Icons.apple, "title": "Apple Store", "subtitle": "Entertainment", "amount": "- \$5,99"},
    {"icon": Icons.music_note, "title": "Spotify", "subtitle": "Music", "amount": "- \$12,99"},
    {"icon": Icons.shopping_cart, "title": "Grocery", "subtitle": "Shopping", "amount": "- \$ 88"},
  ];

  void updateLimit(double value) {
    spendingLimit.value = value;
  }

  void goToAddCard() => Get.toNamed('/add-card');
  void goBack() => Get.toNamed(Routes.home);
}
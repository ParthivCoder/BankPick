import 'package:bankpick/export.dart';

class DashboardController extends GetxController {
  final List<Map<String, dynamic>> transactions = [
    {
      "icon": Icons.apple,
      "title": "Apple Store",
      "subtitle": "Entertainment",
      "amount": "- \$5,99",
      "color": null
    },
    {
      "icon": Icons.music_note,
      "title": "Spotify",
      "subtitle": "Music",
      "amount": "- \$12,99",
      "color": Colors.green
    },
    {
      "icon": Icons.download,
      "title": "Money Transfer",
      "subtitle": "Transaction",
      "amount": "\$300",
      "color": Colors.blue
    },
    {
      "icon": Icons.shopping_cart,
      "title": "Grocery",
      "subtitle": "Shopping",
      "amount": "- \$88",
      "color": Colors.orange
    },
  ];

  void goToSearch() => Get.toNamed(Routes.search);
  void goToSendMoney() => Get.toNamed(Routes.sendMoney);
  void goToRequestMoney() => Get.toNamed(Routes.requestMoney);
  void goToHistory() => Get.toNamed(Routes.transactionHistory);
  // void goToNotifications() => Get.toNamed(Routes.notifications);
}
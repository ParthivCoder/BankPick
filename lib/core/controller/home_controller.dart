import 'package:bankpick/export.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomePage(),
    const MyCardsPage(),
    const StatisticsPage(),
    const SettingsPage(),
  ];

  final List<Map<String, dynamic>> homeTransactions = [
    {"icon": Icons.apple, "title": "Apple Store", "subtitle": "Entertainment", "amount": "- \$5,99", "color": null},
    {"icon": Icons.music_note, "title": "Spotify", "subtitle": "Music", "amount": "- \$12,99", "color": Colors.green},
    {"icon": Icons.download, "title": "Money Transfer", "subtitle": "Transaction", "amount": "\$300", "color": Colors.blue},
    {"icon": Icons.shopping_cart, "title": "Grocery", "subtitle": "Shopping", "amount": "- \$88", "color": Colors.orange},
  ];

  void changeIndex(int index) => selectedIndex.value = index;

  void goToSendMoney() => Get.toNamed(Routes.sendMoney);
  void goToRequestMoney() => Get.toNamed(Routes.requestMoney);
  void goToSearch() => Get.toNamed(Routes.search);
  void goToHistory() => Get.toNamed(Routes.transactionHistory);
}
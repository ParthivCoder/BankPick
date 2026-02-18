import 'package:bankpick/export.dart';

class TransactionController extends GetxController {
  final List<Map<String, dynamic>> transactions = [
    {"icon": Icons.apple, "title": "Apple Store", "subtitle": "Entertainment", "amount": "- \$5,99"},
    {"icon": Icons.music_note, "title": "Spotify", "subtitle": "Music", "amount": "- \$12,99", "color": Colors.green},
    {"icon": Icons.download, "title": "Money Transfer", "subtitle": "Transaction", "amount": "\$300", "color": Colors.blue},
    {"icon": Icons.shopping_cart, "title": "Grocery", "subtitle": "Shopping", "amount": "- \$88", "color": Colors.orange},
    {"icon": Icons.play_arrow, "title": "Netflix", "subtitle": "Entertainment", "amount": "- \$5,99", "color": Colors.red},
    {"icon": Icons.music_note, "title": "Spotify", "subtitle": "Music", "amount": "- \$12,99", "color": Colors.green},
    {"icon": Icons.download, "title": "Money Transfer", "subtitle": "Transaction", "amount": "\$300", "color": Colors.blue},
    {"icon": Icons.music_note, "title": "Spotify", "subtitle": "Music", "amount": "- \$12,99", "color": Colors.green},
    {"icon": Icons.shopping_cart, "title": "Grocery", "subtitle": "Shopping", "amount": "- \$88", "color": Colors.orange},
  ];

  Color getIconColor(int index, BuildContext context) {
    return transactions[index]['color'] as Color? ?? AppColors.getTextColor(context);
  }

  void goBack() => Get.back();
}
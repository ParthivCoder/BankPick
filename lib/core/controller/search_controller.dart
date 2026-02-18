import 'package:bankpick/export.dart';

class AppSearchController extends GetxController {
  final TextEditingController textController = TextEditingController();

  final List<Map<String, dynamic>> allItems = [
    {"icon": Icons.apple, "title": "Apple Store", "sub": "Entertainment", "amt": "- \$5,99"},
    {"icon": Icons.music_note, "title": "Spotify", "sub": "Music", "amt": "- \$12,99", "color": Colors.green},
    {"icon": Icons.download, "title": "Money Transfer", "sub": "Transaction", "amt": "\$300", "color": Colors.blue},
    {"icon": Icons.shopping_cart, "title": "Grocery", "sub": "Shopping", "amt": "- \$88", "color": Colors.orange},
    {"icon": Icons.play_arrow, "title": "Netflix", "sub": "Entertainment", "amt": "- \$5,99", "color": Colors.red},
  ];

  var filteredItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    filteredItems.assignAll(allItems);
    super.onInit();
  }

  void filterSearch(String query) {
    if (query.isEmpty) {
      filteredItems.assignAll(allItems);
    } else {
      filteredItems.assignAll(
        allItems.where((item) =>
        item['title'].toString().toLowerCase().contains(query.toLowerCase()) ||
            item['sub'].toString().toLowerCase().contains(query.toLowerCase())
        ).toList(),
      );
    }
  }

  void clearSearch() {
    textController.clear();
    filterSearch('');
  }

  void goBack() => Get.back();

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
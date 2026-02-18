import 'package:bankpick/export.dart';

class StatisticsController extends GetxController {
  final RxString selectedMonth = "Jan".obs;

  final List<String> months = ["Oct", "Nov", "Dec", "Jan", "Feb", "Mar"];

  final List<ChartDataModel> chartData = [
    ChartDataModel(0, 3),
    ChartDataModel(1, 1),
    ChartDataModel(2, 4),
    ChartDataModel(3, 2),
    ChartDataModel(4, 5),
    ChartDataModel(5, 3),
    ChartDataModel(6, 4),
  ];

  final List<Map<String, dynamic>> recentTransactions = [
    {
      "icon": Icons.apple,
      "title": "Apple Store",
      "subtitle": "Entertainment",
      "amount": "- \$5,99",
      "isCustomColor": false
    },
    {
      "icon": Icons.music_note,
      "title": "Spotify",
      "subtitle": "Music",
      "amount": "- \$12,99",
      "color": Colors.green,
      "isCustomColor": true
    },
    {
      "icon": Icons.download,
      "title": "Money Transfer",
      "subtitle": "Transaction",
      "amount": "\$300",
      "color": Colors.blue,
      "isCustomColor": true
    },
  ];

  void selectMonth(String month) {
    selectedMonth.value = month;
  }

  void goBack() => Get.back();
  void goToHistory() => Get.toNamed('/transaction-history');
}

class ChartDataModel {
  ChartDataModel(this.x, this.y);
  final num x;
  final num y;
}
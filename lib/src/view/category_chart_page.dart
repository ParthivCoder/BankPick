import 'package:bankpick/export.dart';

class CategoryChartPage extends StatelessWidget {
  const CategoryChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.getTextColor(context), size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCategoryChartSection(context),
            const SizedBox(height: 24),
            _buildTransactionHistorySection(context, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChartSection(BuildContext context) {
    final List<_ChartData> chartData = [
      _ChartData('Transaction', 30, const Color(0xFFD988F2)),
      _ChartData('Food', 25, const Color(0xFFF299B1)),
      _ChartData('Travel', 20, const Color(0xFF88F2D9)),
      _ChartData('Shopping', 20, const Color(0xFFB199F2)),
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.getSecondaryBg(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Category Chart",
            style: TextStyle(
              color: AppColors.getTextColor(context),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: SfCircularChart(
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "55%",
                        style: TextStyle(
                          color: AppColors.getTextColor(context),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Transaction",
                        style: TextStyle(
                          color: AppColors.getTextGrey(context),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
              series: <CircularSeries<_ChartData, String>>[
                DoughnutSeries<_ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  pointColorMapper: (_ChartData data, _) => data.color,
                  innerRadius: '80%',
                  radius: '100%',
                  cornerStyle: CornerStyle.bothCurve,
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 2.5,
            children: [
              _buildLegend(context, "Transaction", const Color(0xFFF2B199)),
              _buildLegend(context, "Transfer", const Color(0xFF88F2D9)),
              _buildLegend(context, "Travel", const Color(0xFF5CC8FF)),
              _buildLegend(context, "Food", const Color(0xFFD988F2)),
              _buildLegend(context, "Shopping", const Color(0xFFF299B1)),
              _buildLegend(context, "Car", const Color(0xFF88F2A0)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(BuildContext context, String label, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: TextStyle(color: AppColors.getTextColor(context), fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionHistorySection(BuildContext context, DashboardController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transaction History",
                style: TextStyle(
                  color: AppColors.getTextColor(context),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () => controller.goToHistory(),
                child: const Text("See All", style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          _buildDateHeader(context, "Today"),
          _buildTransactionItem(context, Icons.apple, "Apple Store", "Entertainment", "-\$5,99"),
          _buildTransactionItem(context, Icons.music_note, "Spotify", "Music", "-\$12,99"),
          const SizedBox(height: 10),
          _buildDateHeader(context, "Last 7 Day"),
          _buildTransactionItem(context, Icons.music_note, "Spotify", "Music", "-\$12,99"),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildDateHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 14),
      ),
    );
  }

  Widget _buildTransactionItem(BuildContext context, IconData icon, String title, String sub, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.getSecondaryBg(context),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.getTextColor(context), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: AppColors.getTextColor(context), fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(sub, style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 12)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(color: AppColors.getTextColor(context), fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
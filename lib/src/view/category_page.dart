import 'package:bankpick/export.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            _buildChartSection(context),
            const SizedBox(height: 30),
            _buildHistorySection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildChartSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.getSecondaryBg(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category Chart",
            style: TextStyle(
              color: AppColors.getTextColor(context),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    value: 0.55,
                    strokeWidth: 12,
                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.purpleAccent),
                  ),
                ),
                Column(
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
                      style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          _buildLegendGrid(context),
        ],
      ),
    );
  }

  Widget _buildLegendGrid(BuildContext context) {
    final legends = [
      {"label": "Transaction", "color": Colors.orange},
      {"label": "Transfer", "color": Colors.tealAccent},
      {"label": "Travel", "color": Colors.cyan},
      {"label": "Food", "color": Colors.pinkAccent},
      {"label": "Shopping", "color": Colors.orangeAccent},
      {"label": "Car", "color": Colors.lightGreenAccent},
    ];

    return Wrap(
      spacing: 20,
      runSpacing: 16,
      children: legends.map((item) {
        return SizedBox(
          width: Get.width * 0.25,
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: item['color'] as Color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                item['label'] as String,
                style: TextStyle(color: AppColors.getTextColor(context), fontSize: 12),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildHistorySection(BuildContext context) {
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
              Text(
                "See All",
                style: TextStyle(color: AppColors.primaryBlue, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildTimelineGroup(context, "Today", [
            {"icon": Icons.apple, "title": "Apple Store", "sub": "Entertainment", "amt": "- \$5,99"},
            {"icon": Icons.music_note, "title": "Spotify", "sub": "Music", "amt": "- \$12,99", "color": Colors.green},
          ]),
          const SizedBox(height: 20),
          _buildTimelineGroup(context, "Last 7 Day", [
            {"icon": Icons.music_note, "title": "Spotify", "sub": "Music", "amt": "- \$12,99", "color": Colors.green},
          ]),
        ],
      ),
    );
  }

  Widget _buildTimelineGroup(BuildContext context, String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 14)),
        const SizedBox(height: 10),
        ...items.map((item) => _transactionTile(context, item)),
      ],
    );
  }

  Widget _transactionTile(BuildContext context, Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: AppColors.getSecondaryBg(context),
              shape: BoxShape.circle,
            ),
            child: Icon(
              item['icon'] as IconData,
              color: item['color'] as Color? ?? AppColors.getTextColor(context),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'] as String,
                  style: TextStyle(color: AppColors.getTextColor(context), fontWeight: FontWeight.bold),
                ),
                Text(
                  item['sub'] as String,
                  style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            item['amt'] as String,
            style: TextStyle(
              color: AppColors.getTextColor(context),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
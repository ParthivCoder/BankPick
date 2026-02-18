import 'package:bankpick/export.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final StatisticsController controller = Get.put(StatisticsController());

    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: _buildAppBar(context, controller),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              "Current Balance",
              style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "\$8,545.00",
              style: TextStyle(
                color: AppColors.getTextColor(context),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            _buildChart(context, controller),
            const SizedBox(height: 30),
            _buildMonthSelector(context, controller),
            const SizedBox(height: 40),
            _buildTransactionHeader(context, controller),
            const SizedBox(height: 20),
            _buildTransactionList(context, controller),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, StatisticsController controller) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: AppColors.getTextColor(context), size: 20),
        onPressed: () => Get.find<HomeController>().selectedIndex.value = 0,
      ),
      title: Text("Statistics", style: TextStyle(color: AppColors.getTextColor(context))),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.getSecondaryBg(context),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.notifications_none, color: AppColors.getTextColor(context)),
        ),
      ],
    );
  }

  Widget _buildChart(BuildContext context, StatisticsController controller) {
    return SizedBox(
      height: 150,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        margin: EdgeInsets.zero,
        primaryXAxis: const NumericAxis(isVisible: false),
        primaryYAxis: const NumericAxis(isVisible: false),
        series: <CartesianSeries<ChartDataModel, num>>[
          SplineAreaSeries<ChartDataModel, num>(
            dataSource: controller.chartData,
            xValueMapper: (ChartDataModel data, _) => data.x,
            yValueMapper: (ChartDataModel data, _) => data.y,
            color: AppColors.primaryBlue.withValues(alpha: 0.15),
            borderColor: AppColors.primaryBlue,
            borderWidth: 4,
            markerSettings: MarkerSettings(
              isVisible: true,
              height: 12,
              width: 12,
              shape: DataMarkerType.circle,
              color: AppColors.primaryBlue,
              borderColor: AppColors.getBgColor(context),
              borderWidth: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSelector(BuildContext context, StatisticsController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: controller.months.map((month) {
        return Obx(() {
          bool isSelected = controller.selectedMonth.value == month;
          return GestureDetector(
            onTap: () => controller.selectMonth(month),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.8, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                month,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.getTextGrey(context),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        });
      }).toList(),
    );
  }

  Widget _buildTransactionHeader(BuildContext context, StatisticsController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Transaction",
            style: TextStyle(
                color: AppColors.getTextColor(context),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: controller.goToHistory,
          child: const Text("See All", style: TextStyle(color: AppColors.primaryBlue, fontSize: 14)),
        ),
      ],
    );
  }

  Widget _buildTransactionList(BuildContext context, StatisticsController controller) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.recentTransactions.length,
      itemBuilder: (context, index) {
        final item = controller.recentTransactions[index];
        final amountStr = item['amount'] as String;
        final isNegative = amountStr.startsWith('-');
        final iconColor = item['isCustomColor'] == true
            ? item['color'] as Color
            : AppColors.getTextColor(context);

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: AppColors.getSecondaryBg(context),
            child: Icon(item['icon'] as IconData, color: iconColor),
          ),
          title: Text(item['title'] as String,
              style: TextStyle(
                  color: AppColors.getTextColor(context), fontWeight: FontWeight.bold)),
          subtitle: Text(item['subtitle'] as String,
              style: TextStyle(color: AppColors.getTextGrey(context))),
          trailing: Text(
            amountStr,
            style: TextStyle(
              color: isNegative ? AppColors.getTextColor(context) : AppColors.primaryBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
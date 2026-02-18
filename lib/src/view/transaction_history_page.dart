import 'package:bankpick/export.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionController controller = Get.put(TransactionController());

    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: _buildAppBar(context, controller),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildSectionHeader(context, "Today"),
            const SizedBox(height: 10),
            _buildTransactionList(context, controller),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, TransactionController controller) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 70,
      leading: Center(
        child: GestureDetector(
          onTap: controller.goBack,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.getSecondaryBg(context),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back_ios_new,
                color: AppColors.getTextColor(context), size: 18),
          ),
        ),
      ),
      title: Text(
        "Transaction History",
        style: TextStyle(
          color: AppColors.getTextColor(context),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () => Get.to(() => const CategoryChartPage()),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.getSecondaryBg(context),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.history,
                color: AppColors.getTextColor(context),
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.getTextColor(context),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "See All",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionList(BuildContext context, TransactionController controller) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.transactions.length,
      itemBuilder: (context, index) {
        final item = controller.transactions[index];

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.getSecondaryBg(context),
              shape: BoxShape.circle,
            ),
            child: Icon(
              item['icon'] as IconData,
              color: controller.getIconColor(index, context),
            ),
          ),
          title: Text(
            item['title'] as String,
            style: TextStyle(
              color: AppColors.getTextColor(context),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            item['subtitle'] as String,
            style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 13),
          ),
          trailing: Text(
            item['amount'] as String,
            style: TextStyle(
              color: (item['amount'] as String).startsWith('-')
                  ? AppColors.getTextColor(context)
                  : AppColors.primaryBlue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}
import 'package:bankpick/export.dart';

class MyCardsPage extends StatelessWidget {
  const MyCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CardsController controller = Get.put(CardsController());

    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: _buildAppBar(context, controller),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildCreditCard(context),
            const SizedBox(height: 30),
            _buildTransactionList(context, controller),
            const SizedBox(height: 30),
            Text(
              "Monthly spending limit",
              style: TextStyle(
                color: AppColors.getTextColor(context),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildSpendingLimitCard(context, controller),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, CardsController controller) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: AppColors.getTextColor(context), size: 20),
        onPressed: () => Get.find<HomeController>().selectedIndex.value = 0,
      ),
      title: Text("My Cards", style: TextStyle(color: AppColors.getTextColor(context))),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: controller.goToAddCard,
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.getSecondaryBg(context),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, color: AppColors.getTextColor(context)),
          ),
        ),
      ],
    );
  }

  Widget _buildCreditCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: AppColors.mix,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        image: const DecorationImage(
          image: AssetImage("assets/images/world.png"),
          fit: BoxFit.cover,
          opacity: 0.90,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/icons/chip.png", height: 30),
              const Opacity(
                opacity: 0.2,
                child: Icon(Icons.contactless_outlined, color: AppColors.white, size: 35),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "4562  1122  4595  7852",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          const Text("AR Jonson", style: TextStyle(color: AppColors.white, fontSize: 16)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  _cardDetail(context, "Expiry Date", "24/2000"),
                  const SizedBox(width: 35),
                  _cardDetail(context, "CVV", "6986"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/icons/mastercard.png', height: 20, fit: BoxFit.contain),
                  const SizedBox(height: 4),
                  const Text("Mastercard", style: TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardDetail(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white54, fontSize: 10),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionList(BuildContext context, CardsController controller) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.cardTransactions.length,
      itemBuilder: (context, index) {
        final item = controller.cardTransactions[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: AppColors.getSecondaryBg(context),
            child: Icon(item['icon'] as IconData, color: AppColors.getTextColor(context)),
          ),
          title: Text(item['title'] as String, style: TextStyle(color: AppColors.getTextColor(context), fontWeight: FontWeight.bold)),
          subtitle: Text(item['subtitle'] as String, style: TextStyle(color: AppColors.getTextGrey(context))),
          trailing: Text(
            item['amount'] as String,
            style: TextStyle(color: AppColors.getTextColor(context), fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  Widget _buildSpendingLimitCard(BuildContext context, CardsController controller) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.getSecondaryBg(context),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Amount: \$8,545.00",
              style: TextStyle(color: AppColors.getTextColor(context), fontSize: 16)
          ),
          const SizedBox(height: 20),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 6,
              activeTrackColor: AppColors.primaryBlue,
              inactiveTrackColor: AppColors.getTextGrey(context).withValues(alpha: 0.2),
              thumbColor: AppColors.primaryBlue,
              overlayColor: AppColors.primaryBlue.withValues(alpha: 0.2),
              thumbShape: const CustomRoundSliderThumbShape(thumbRadius: 8),
            ),
            child: Obx(() => Slider(
              value: controller.spendingLimit.value,
              onChanged: controller.updateLimit,
            )),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$0", style: TextStyle(color: AppColors.getTextGrey(context))),
              Obx(() => Text("\$${(controller.spendingLimit.value * 10000).toInt()}", style: TextStyle(color: AppColors.getTextColor(context)))),
              Text("\$10,000", style: TextStyle(color: AppColors.getTextGrey(context))),
            ],
          )
        ],
      ),
    );
  }
}

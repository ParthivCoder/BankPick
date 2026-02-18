import 'package:bankpick/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, dashboardController),
              const SizedBox(height: 30),
              _buildCreditCard(context),
              const SizedBox(height: 30),
              _buildActionMenu(dashboardController),
              const SizedBox(height: 30),
              _buildTransactionHeader(dashboardController),
              const SizedBox(height: 20),
              _buildTransactionList(context, dashboardController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, DashboardController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome back,", style: TextStyle(color: Colors.grey, fontSize: 14)),
                Text(
                  "Tanya Myroniuk",
                  style: TextStyle(
                    color: AppColors.getTextColor(context),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: controller.goToSearch,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.getSecondaryBg(context),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.search, color: AppColors.getTextColor(context)),
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
                  const SizedBox(width: 35),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/icons/mastercard.png', height: 20, fit: BoxFit.contain),
                  const SizedBox(height: 4),
                  const Text("Mastercard",
                      style: TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w500)),
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

  Widget _buildActionMenu(DashboardController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _actionItem("assets/icons/sent.png", "Sent", controller.goToSendMoney),
        _actionItem("assets/icons/receive.png", "Receive", controller.goToRequestMoney),
        _actionItem("assets/icons/loan.png", "Loan", () {}),
        _actionItem("assets/icons/topup.png", "Topup", () {}),
      ],
    );
  }

  Widget _actionItem(String iconPath, String label, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color(0xFF1E2130),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              iconPath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildTransactionHeader(DashboardController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Transaction",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: controller.goToHistory,
          child: const Text("See All", style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }

  Widget _buildTransactionList(BuildContext context, DashboardController controller) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.transactions.length,
      itemBuilder: (context, index) {
        final item = controller.transactions[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: Color(0xFF1E2130), shape: BoxShape.circle),
            child: Icon(item['icon'] as IconData, color: item['color'] as Color? ?? Colors.white),
          ),
          title: Text(
            item['title'],
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(item['subtitle'], style: const TextStyle(color: Colors.grey)),
          trailing: Text(
            item['amount'],
            style: TextStyle(
              color: item['amount'].contains('-') ? Colors.white : Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}
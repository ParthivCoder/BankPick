import 'package:bankpick/export.dart';

class AllCardsPage extends StatelessWidget {
  const AllCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.getSecondaryBg(context),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back_ios_new,
                color: AppColors.getTextColor(context), size: 18),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "All Cards",
          style: TextStyle(
            color: AppColors.getTextColor(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildCreditCard(
                  context,
                  cardNumber: "4562  1122  4595  7852",
                  holderName: "AR Jonson",
                  expiry: "24/2000",
                  cvv: "6986",
                  isMastercard: true,
                ),
                const SizedBox(height: 20),
                _buildCreditCard(
                  context,
                  cardNumber: "4562  1122  4595  7852",
                  holderName: "Smith Jonson",
                  expiry: "24/2000",
                  isMastercard: false,
                ),
                const SizedBox(height: 100),
                const SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: CustomButton(
              text: "Add Card +",
              onPressed: () => Get.toNamed('/add-card'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCard(
      BuildContext context, {
        required String cardNumber,
        required String holderName,
        required String expiry,
        String? cvv,
        required bool isMastercard,
      }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: isMastercard
              ? AppColors.mix
              : [const Color(0xFF2E2E3E), const Color(0xFF1E1E2C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(isMastercard ? Icons.developer_board : Icons.sim_card,
                  color: Colors.white.withValues(alpha: 0.5), size: 30),
              Icon(Icons.contactless_outlined,
                  color: Colors.white.withValues(alpha: 0.3), size: 30),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            cardNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            holderName,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Expiry Date",
                      style: TextStyle(color: Colors.white54, fontSize: 10)),
                  Text(expiry,
                      style: const TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
              if (cvv != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("CVV",
                        style: TextStyle(color: Colors.white54, fontSize: 10)),
                    Text(cvv,
                        style: const TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                ),
              isMastercard
                  ? Image.asset('assets/icons/mastercard.png', height: 30)
                  : const Text(
                "VISA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
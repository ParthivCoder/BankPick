import 'package:bankpick/export.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

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
            decoration: BoxDecoration(color: AppColors.getSecondaryBg(context), shape: BoxShape.circle),
            child: Icon(Icons.arrow_back_ios_new, color: AppColors.getTextColor(context), size: 18),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text("Add New Card", style: TextStyle(color: AppColors.getTextColor(context), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Reusing your HomeContent card style but with static White text
            _buildCardPreview(),
            const SizedBox(height: 40),
            _buildCardInput(context, "Cardholder Name", "Tanya Myroniuk", Icons.person_outline),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _buildCardInput(context, "Expiry Date", "09/06/2024", null)),
                const SizedBox(width: 20),
                Expanded(child: _buildCardInput(context, "4-digit CVV", "6986", null, isCvv: true)),
              ],
            ),
            const SizedBox(height: 24),
            _buildCardInput(context, "Card Number", "4562 1122 4595 7852", Icons.print_outlined, showMastercard: true),
          ],
        ),
      ),
    );
  }

  Widget _buildCardPreview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(colors: AppColors.mix, begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/icons/chip.png", height: 30),
              const Icon(Icons.contactless_outlined, color: Colors.white, size: 30),
            ],
          ),
          const SizedBox(height: 30),
          const Text("4562  1122  4595  7852", style: TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 1.2)),
          const SizedBox(height: 10),
          const Text("AR Jonson", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Expiry Date\n24/2000", style: TextStyle(color: Colors.white70, fontSize: 12)),
              const Text("CVV\n6986", style: TextStyle(color: Colors.white70, fontSize: 12)),
              Image.asset('assets/icons/mastercard.png', height: 30),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardInput(BuildContext context, String label, String value, IconData? icon, {bool isCvv = false, bool showMastercard = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 14)),
        TextField(
          controller: TextEditingController(text: value),
          style: TextStyle(color: AppColors.getTextColor(context)),
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, color: AppColors.getTextGrey(context), size: 20) : null,
            suffixIcon: showMastercard ? Image.asset('assets/icons/mastercard.png', width: 30) : null,
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.getTextGrey(context).withOpacity(0.2))),
          ),
        ),
      ],
    );
  }
}
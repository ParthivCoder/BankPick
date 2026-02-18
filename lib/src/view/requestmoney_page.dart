import 'package:bankpick/export.dart';

class RequestMoneyPage extends StatelessWidget {
  const RequestMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequestMoneyController());

    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildInputField(context, "Payer Name", controller.payerNameController, Icons.person_outline),
            _buildInputField(context, "Email Address", controller.emailController, Icons.email_outlined),
            _buildInputField(context, "Description", controller.descriptionController, Icons.person_outline),
            const SizedBox(height: 20),
            Text("Monthly Due By", style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _buildDateInput(context, controller.dayController)),
                const SizedBox(width: 15),
                Expanded(child: _buildDateInput(context, controller.monthController)),
                const SizedBox(width: 15),
                Expanded(child: _buildDateInput(context, controller.yearController)),
              ],
            ),
            const SizedBox(height: 30),
            _buildAmountCard(context, controller),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.sendRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("Send Money", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Center(
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.getSecondaryBg(context), shape: BoxShape.circle),
            child: Icon(Icons.arrow_back_ios_new, color: AppColors.getTextColor(context), size: 18),
          ),
        ),
      ),
      title: Text("Request Money", style: TextStyle(color: AppColors.getTextColor(context), fontWeight: FontWeight.bold)),
      centerTitle: true,
    );
  }

  Widget _buildInputField(BuildContext context, String label, TextEditingController ctr, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 14)),
          TextField(
            controller: ctr,
            style: TextStyle(color: AppColors.getTextColor(context)),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: AppColors.getTextGrey(context), size: 20),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.getTextGrey(context).withOpacity(0.2))),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primaryBlue)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateInput(BuildContext context, TextEditingController ctr) {
    return TextField(
      controller: ctr,
      textAlign: TextAlign.center,
      style: TextStyle(color: AppColors.getTextColor(context)),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.getTextGrey(context).withOpacity(0.2))),
      ),
    );
  }

  Widget _buildAmountCard(BuildContext context, RequestMoneyController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.getSecondaryBg(context),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Enter Your Amount", style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 12)),
              Text("Change Currency?", style: TextStyle(color: Colors.red.shade400, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Obx(() => Text(controller.currency.value, style: TextStyle(color: AppColors.getTextColor(context), fontSize: 24, fontWeight: FontWeight.bold))),
              const SizedBox(width: 15),
              Expanded(
                child: TextField(
                  controller: controller.amountController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: AppColors.getTextColor(context), fontSize: 24, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
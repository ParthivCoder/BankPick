import 'package:bankpick/export.dart';

class SendMoneyPage extends StatelessWidget {
  const SendMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        leading: Center(
          child: GestureDetector(
            onTap: () => Get.back(),
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
          "Send Money",
          style: TextStyle(
            color: AppColors.getTextColor(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildCreditCard(context),
            const SizedBox(height: 30),
            _buildSendToSection(context),
            const SizedBox(height: 30),
            _buildAmountInput(context),
            const SizedBox(height: 40),
            CustomButton(
              text: "Send Money",
              onPressed: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
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

  Widget _buildSendToSection(BuildContext context) {
    final contacts = [
      {"name": "Yamilet", "img": "assets/images/p1.png"},
      {"name": "Alexa", "img": "assets/images/p2.png"},
      {"name": "Yakub", "img": "assets/images/p3.png"},
      {"name": "Krishna", "img": "assets/images/p4.png"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Send to",
          style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 16),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildAddContact(context),
              ...contacts.map((c) => _buildContactAvatar(context, c['name']!, c['img']!)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddContact(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryBlue, width: 1.5),
            ),
            child: const Icon(Icons.add, color: AppColors.primaryBlue),
          ),
          const SizedBox(height: 8),
          Text("Add", style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildContactAvatar(BuildContext context, String name, String asset) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 27.5,
            backgroundImage: AssetImage('assets/images/profile.png'), // Placeholder
          ),
          const SizedBox(height: 8),
          Text(name, style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildAmountInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.getSecondaryBg(context),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Enter Your Amount", style: TextStyle(color: AppColors.getTextGrey(context))),
              const Text("Change Currency?", style: TextStyle(color: Colors.redAccent, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                "USD",
                style: TextStyle(
                  color: AppColors.getTextColor(context),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: AppColors.getTextColor(context),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    hintText: "00.00",
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:bankpick/export.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.getTextColor(context), size: 20),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(color: AppColors.getTextColor(context)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          "L15.1 Thank you for visiting our Application \n Doctor 24×7 and enrolling as a member.\n"
          "\n 15.2 Your privacy is important to us. To better \n protect  your privacy, we are providing \n this notice explaining our policy with regards to the information you share with us. This privacy policy relates to the information we collect, online from Application, received through the email, by fax or telephone, or in person or in any other way and retain and use for the purpose of providing you services. If you do not agree to the terms in this Policy, we kindly ask you not to use these portals and/or sign the contract document."
          "\n\n 15.3 In order to use the services of this Application, You are required to register yourself by verifying the authorised device. This Privacy Policy applies to your information that we collect and receive on and through Doctor 24×7; it does not apply to practices of businesses that we do not own or control or people we do not employ."
          "\n\n 15.4 By using this Application, you agree to the terms of this Privacy Policy.",
          style: TextStyle(
            color: AppColors.getTextGrey(context),
            fontSize: 15,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
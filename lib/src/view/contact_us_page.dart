import 'package:bankpick/export.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

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
          "Contact Us",
          style: TextStyle(color: AppColors.getTextColor(context)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildContactMethod(context, Icons.headset_mic_outlined, "Customer Service", "Available 24/7"),
            _buildContactMethod(context, Icons.language, "Website", "www.bankpick.com"),
            _buildContactMethod(context, Icons.email_outlined, "Email", "support@bankpick.com"),
          ],
        ),
      ),
    );
  }

  Widget _buildContactMethod(BuildContext context, IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.getSecondaryBg(context),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryBlue),
        title: Text(
          title,
          style: TextStyle(color: AppColors.getTextColor(context), fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: AppColors.getTextGrey(context)),
        ),
        onTap: () {},
      ),
    );
  }
}
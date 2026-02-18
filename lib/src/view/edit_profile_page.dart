import 'package:bankpick/export.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.getTextColor(context)),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: AppColors.getTextColor(context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildAvatarSection(context),
            const SizedBox(height: 40),
            _buildEditField(context, "Full Name", "Tanya Myroniuk", Icons.person_outline),
            _buildEditField(context, "Email Address", "tanyamyroniuk@gmail.com", Icons.mail_outline),
            _buildEditField(context, "Phone Number", "+88017126663389", Icons.phone_outlined),
            _buildBirthDateField(context),
            const SizedBox(height: 30),
            Text(
              "Joined 28 Jan 2021",
              style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 13),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "Tanya Myroniuk",
          style: TextStyle(
            color: AppColors.getTextColor(context),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Senior Designer",
          style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildEditField(BuildContext context, String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: AppColors.getTextColor(context), fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.getSecondaryBg(context),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.getTextGrey(context), size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildBirthDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Birth Date",
          style: TextStyle(color: AppColors.getTextColor(context), fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.getSecondaryBg(context),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.calendar_month_outlined, color: AppColors.getTextGrey(context), size: 20),
              const SizedBox(width: 12),
              Text(
                "28  September  12  2000",
                style: TextStyle(
                  color: AppColors.getTextColor(context),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
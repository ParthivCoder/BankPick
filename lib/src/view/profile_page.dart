import 'package:bankpick/export.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.getTextColor(context), size: 20),
          onPressed: () =>  Get.back(),
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: AppColors.getTextColor(context)),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.editProfile),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.getSecondaryBg(context),
                shape: BoxShape.circle,
              ),
              child: ImageIcon(
                const AssetImage("assets/icons/edituser.png"),
                color: AppColors.getTextColor(context),
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 30),
            _buildProfileHeader(context),
            const SizedBox(height: 40),
            _buildProfileItem(context, Icons.person_outline, "Personal Information"),
            _buildProfileItem(context, Icons.payment_outlined, "Payment Preferences"),
            _buildProfileItem(
              context,
              Icons.edit_note_outlined,
              "Banks and Cards",
              onTap: () => Get.toNamed('/all-cards'),
            ),
            _buildProfileItem(context, Icons.notifications_none_outlined, "Notifications", badgeCount: 2),
            _buildProfileItem(context, Icons.chat_bubble_outline, "Message Center"),
            _buildProfileItem(context, Icons.location_on_outlined, "Address"),
            _buildProfileItem(
              context,
              Icons.settings_outlined,
              "Settings",
              onTap: () => Get.toNamed('/settings'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile.png'),
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
        const SizedBox(height: 4),
        Text(
          "Senior Designer",
          style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildProfileItem(BuildContext context, IconData icon, String title, {int? badgeCount, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.getTextGrey(context).withValues(alpha: 0.1),
            width: 0.5,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: AppColors.getTextGrey(context), size: 24),
        title: Text(
          title,
          style: TextStyle(color: AppColors.getTextColor(context), fontSize: 16),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badgeCount != null)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badgeCount.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios, color: AppColors.getTextGrey(context), size: 16),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
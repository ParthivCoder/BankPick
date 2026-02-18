import 'package:bankpick/export.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildSectionHeader(context, "General"),
            _buildSettingItem(
              context,
              "Language",
              trailing: "English",
              onTap: controller.goToLanguage,
            ),
            _buildSettingItem(
              context,
              "My Profile",
              onTap: controller.goToProfile,
            ),
            _buildSettingItem(
              context,
              "Contact Us",
              onTap: controller.goToContact,
            ),
            _buildThemeToggle(context, controller),
            const SizedBox(height: 30),
            _buildSectionHeader(context, "Security"),
            _buildSettingItem(
              context,
              "Change Password",
              onTap: controller.goToChangePassword,
            ),
            _buildSettingItem(
              context,
              "Privacy Policy",
              onTap: controller.goToPrivacy,
            ),
            const SizedBox(height: 10),
            Text(
              "Choose what data you share with us",
              style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 13),
            ),
            const SizedBox(height: 20),
            _buildBiometricToggle(context, controller),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: AppColors.getTextColor(context), size: 20),
        onPressed: () => Get.find<HomeController>().selectedIndex.value = 0,
      ),
      title: Text(
        "Settings",
        style: TextStyle(color: AppColors.getTextColor(context)),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 16),
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context, String title, {String? trailing, VoidCallback? onTap}) {
    return Container(
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
        onTap: onTap,
        title: Text(
          title,
          style: TextStyle(color: AppColors.getTextColor(context), fontSize: 16),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (trailing != null)
              Text(
                trailing,
                style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 14),
              ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios, color: AppColors.getTextGrey(context), size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context, SettingsController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Dark Mode",
          style: TextStyle(color: AppColors.getTextColor(context), fontSize: 16),
        ),
        Obx(() => Switch(
          value: controller.isDarkMode.value,
          onChanged: controller.toggleTheme,
          activeTrackColor: AppColors.primaryBlue,
        )),
      ],
    );
  }

  Widget _buildBiometricToggle(BuildContext context, SettingsController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Biometric",
          style: TextStyle(color: AppColors.getTextColor(context), fontSize: 16),
        ),
        Obx(() => Switch(
          value: controller.isBiometricEnabled.value,
          onChanged: controller.toggleBiometric,
          activeTrackColor: AppColors.primaryBlue,
          inactiveTrackColor: AppColors.getTextGrey(context).withValues(alpha: 0.3),
        )),
      ],
    );
  }
}
import 'package:bankpick/export.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.getSecondaryBg(context),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: AppColors.getTextColor(context), size: 18),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: Text(
          "Change Password",
          style: TextStyle(
            color: AppColors.getTextColor(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPasswordField(context, "Current Password"),
            const SizedBox(height: 24),
            _buildPasswordField(context, "New Password", showEye: true),
            const SizedBox(height: 24),
            _buildPasswordField(context, "Confirm New Password", showEye: true),
            const SizedBox(height: 8),
            Text(
              "Both Passwords Must Match",
              style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 12),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0066FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () => Get.back(),
                child: const Text(
                  "Change Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context, String label, {bool showEye = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: AppColors.getTextGrey(context).withValues(alpha: 0.6),
              fontSize: 14
          ),
        ),
        TextField(
          obscureText: true,
          style: TextStyle(color: AppColors.getTextColor(context)),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock_outline,
              color: AppColors.getTextGrey(context).withValues(alpha: 0.5),
              size: 22,
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 35),
            suffixIcon: showEye
                ? Icon(Icons.visibility_outlined, color: AppColors.getTextGrey(context).withValues(alpha: 0.5))
                : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0066FF)),
            ),
          ),
        ),
      ],
    );
  }
}
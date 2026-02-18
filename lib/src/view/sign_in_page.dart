import 'package:bankpick/export.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.getSecondaryBg(context),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.getTextColor(context),
                      size: 20
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Sign In",
                style: TextStyle(
                    color: AppColors.getTextColor(context),
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 35),

              CustomTextField(
                label: "Email Address",
                hint: "tanyamyroniuk@gmail.com",
                prefixIcon: Icons.mail_outline,
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 24),

              Obx(() => CustomTextField(
                label: "Password",
                hint: "••••••••",
                prefixIcon: Icons.lock_outline,
                controller: controller.passwordController,
                obscureText: !controller.isPasswordVisible.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.getTextGrey(context),
                  ),
                  onPressed: controller.toggleVisibility,
                ),
              )),

              const SizedBox(height: 48),

              Obx(() => CustomButton(
                text: "Sign In",
                isLoading: controller.isLoading.value,
                onPressed: controller.login,
              )),

              const SizedBox(height: 24),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "I'm a new user. ",
                    style: TextStyle(color: AppColors.getTextGrey(context)),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () => Get.toNamed('/signup'),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:bankpick/export.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

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
              const SizedBox(height: 20),
              Text(
                "Sign Up",
                style: TextStyle(
                    color: AppColors.getTextColor(context),
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 25),

              CustomTextField(
                label: "Full Name",
                hint: "Tanya Myroniuk",
                prefixIcon: Icons.person_outline,
                controller: controller.nameController,
              ),

              const SizedBox(height: 24),

              CustomTextField(
                label: "Phone Number",
                hint: "+8801712663389",
                prefixIcon: Icons.phone_outlined,
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 24),

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

              const SizedBox(height: 40),

              Obx(() => CustomButton(
                text: "Sign Up",
                isLoading: controller.isLoading.value,
                onPressed: controller.register,
              )),

              const SizedBox(height: 24),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account. ",
                    style: TextStyle(color: AppColors.getTextGrey(context)),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () => Get.toNamed('/signin'),
                          child: const Text(
                            "Sign In",
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
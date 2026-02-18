import 'package:bankpick/export.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  void toggleVisibility() => isPasswordVisible.value = !isPasswordVisible.value;

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
          "Error",
          "Required fields",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white
      );
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 4));

    isLoading.value = false;

    Get.offAllNamed('/home');
  }
}
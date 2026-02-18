import 'package:bankpick/export.dart';

class RequestMoneyController extends GetxController {
  final payerNameController = TextEditingController(text: "Tanya Myroniuk");
  final emailController = TextEditingController(text: "tanya.myroniuk@gmail.com");
  final descriptionController = TextEditingController(text: "Tanya Myroniuk");

  final dayController = TextEditingController(text: "28");
  final monthController = TextEditingController(text: "09");
  final yearController = TextEditingController(text: "2000");

  final amountController = TextEditingController(text: "26.00.00");
  final RxString currency = "USD".obs;

  void sendRequest() {
    Get.back();
    Get.snackbar("Success", "Request sent successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white
    );
  }

  @override
  void onClose() {
    payerNameController.dispose();
    emailController.dispose();
    descriptionController.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    amountController.dispose();
    super.onClose();
  }
}
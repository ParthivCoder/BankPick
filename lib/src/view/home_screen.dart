import 'package:bankpick/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // Use const for better performance

  @override
  Widget build(BuildContext context) {
    // Use Get.find to access the instance created by your Binding
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      body: Obx(() => IndexedStack(
        index: controller.selectedIndex.value,
        children: controller.pages,
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.changeIndex,
        backgroundColor: AppColors.getSecondaryBg(context),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.getTextGrey(context),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Cards"),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart_outline), label: "Stats"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      )),
    );
  }
}
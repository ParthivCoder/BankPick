import 'package:bankpick/export.dart';

class OnbordingPage extends StatelessWidget {
  const OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: const Color(0xFF121420),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                onPageChanged: controller.updateIndex,
                itemBuilder: (context, index) {
                  final page = controller.pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          page["image"]!,height: 300,
                        ),
                        const SizedBox(height: 40),
                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            controller.pages.length,
                                (i) => _buildIndicator(
                                i == controller.currentIndex.value),
                          ),
                        )),
                        const SizedBox(height: 50),
                        Text(
                          page["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          page["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF8E8E93),
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
              child: SizedBox(
                width: 335,
                height: 56,
                child: ElevatedButton(
                  onPressed: controller.next,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0066FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Obx(() => Text(
                    controller.currentIndex.value ==
                        controller.pages.length - 1
                        ? "Get Started"
                        : "Next",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF0066FF) : const Color(0xFF333645),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
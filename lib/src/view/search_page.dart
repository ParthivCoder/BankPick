import 'package:bankpick/export.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppSearchController controller = Get.put(AppSearchController());

    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: _buildAppBar(context, controller),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: _buildSearchBar(context, controller),
          ),
          Expanded(
            child: Obx(() {
              // Now reacts to changes in filteredItems
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: controller.filteredItems.length,
                itemBuilder: (context, index) {
                  return _transactionTile(context, controller.filteredItems[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, AppSearchController controller) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 70,
      leading: Center(
        child: _circleActionButton(
          context,
          icon: Icons.arrow_back_ios_new,
          onTap: () => Get.back(),
        ),
      ),
      title: Text(
        "Search",
        style: TextStyle(
          color: AppColors.getTextColor(context),
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: _circleActionButton(
            context,
            icon: Icons.close,
            onTap: () => Get.back(),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context, AppSearchController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.getSecondaryBg(context),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller.textController,
        style: TextStyle(color: AppColors.getTextColor(context)),
        // Added onChanged to trigger filtering
        onChanged: (value) => controller.filterSearch(value),
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: AppColors.getTextGrey(context)),
          hintText: "Search",
          hintStyle: TextStyle(color: AppColors.getTextGrey(context)),
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: controller.clearSearch,
            child: Icon(Icons.close, color: AppColors.getTextGrey(context), size: 18),
          ),
        ),
      ),
    );
  }

  Widget _transactionTile(BuildContext context, Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.getSecondaryBg(context),
              shape: BoxShape.circle,
            ),
            child: Icon(
              item['icon'] as IconData,
              color: item['color'] as Color? ?? AppColors.getTextColor(context),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'] as String,
                  style: TextStyle(
                    color: AppColors.getTextColor(context),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  item['sub'] as String,
                  style: TextStyle(color: AppColors.getTextGrey(context), fontSize: 13),
                ),
              ],
            ),
          ),
          Text(
            item['amt'] as String,
            style: TextStyle(
              color: (item['amt'] as String).startsWith('-')
                  ? AppColors.getTextColor(context)
                  : AppColors.primaryBlue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleActionButton(BuildContext context, {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.getSecondaryBg(context),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.getTextColor(context), size: 18),
      ),
    );
  }
}
import 'package:bankpick/export.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLanguage = "English";

  final List<Map<String, String>> languages = [
    {"name": "English", "flag": "🇺🇸"},
    {"name": "Australia", "flag": "🇦🇺"},
    {"name": "Franch", "flag": "🇫🇷"},
    {"name": "Spanish", "flag": "🇪🇸"},
    {"name": "America", "flag": "🇦🇲"},
    {"name": "Vietnam", "flag": "🇻🇳"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBgColor(context),
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildSearchBar(context),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                itemCount: languages.length,
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.getTextGrey(context).withValues(alpha: 0.1),
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  final isSelected = selectedLanguage == lang['name'];

                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      setState(() {
                        selectedLanguage = lang['name']!;
                      });
                    },
                    leading: Text(
                      lang['flag']!,
                      style: const TextStyle(fontSize: 30),
                    ),
                    title: Text(
                      lang['name']!,
                      style: TextStyle(
                        color: AppColors.getTextColor(context),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check_circle, color: AppColors.primaryBlue)
                        : null,
                  );
                },
              ),
            ),
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
        onPressed: () => Get.back(),
      ),
      title: Text(
        "Language",
        style: TextStyle(
          color: AppColors.getTextColor(context),
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.getSecondaryBg(context),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: TextStyle(color: AppColors.getTextColor(context)),
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: AppColors.getTextGrey(context)),
          hintText: "Search Language",
          hintStyle: TextStyle(color: AppColors.getTextGrey(context)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
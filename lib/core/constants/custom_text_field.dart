import 'package:bankpick/export.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.getTextGrey(context),
            fontSize: 14,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          autocorrect: false,
          enableSuggestions: false,
          autofillHints: null,
          style: TextStyle(
            color: AppColors.getTextColor(context),
            fontSize: 16,
          ),
          cursorColor: AppColors.primaryBlue,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.getHintGrey(context),
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: AppColors.getTextGrey(context),
              size: 22,
            ),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.getSecondaryBg(context),
                width: 1.5,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryBlue,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
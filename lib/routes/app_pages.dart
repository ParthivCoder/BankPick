import 'package:bankpick/export.dart';
import 'package:bankpick/src/view/edit_profile_page.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    // GetPage(
    //   name: Routes.splash,
    //   page: () => const SplashScreen(),
    // ),
    GetPage(
      name: Routes.onboarding,
      page: () => const OnbordingPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () =>  HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.signin,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: Routes.search,
      page: () => const SearchPage(),
    ),
    GetPage(
      name: Routes.statistics,
      page: () => const StatisticsPage(),
    ),
    GetPage(
      name: Routes.myCards,
      page: () => const MyCardsPage(),
    ),
    GetPage(
      name: Routes.addCard,
      page: () => const AddCardPage(),
    ),
    GetPage(
      name: Routes.allCards,
      page: () => const AllCardsPage(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsPage(),
    ),
    GetPage(
      name: Routes.transactionHistory,
      page: () => const TransactionHistoryPage(),
    ),
    GetPage(
      name: Routes.sendMoney,
      page: () => const SendMoneyPage(),
    ),
    GetPage(
      name: Routes.requestMoney,
      page: () => const RequestMoneyPage(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfilePage(),
    ),
    GetPage(
      name: Routes.language,
      page: () => const LanguagePage(),
    ),
  ];
}
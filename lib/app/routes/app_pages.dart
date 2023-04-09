import 'package:get/get.dart';

import '../modules/add/bindings/add_binding.dart';
import '../modules/add/views/add_view.dart';
import '../modules/friends/bindings/friends_binding.dart';
import '../modules/friends/views/friends_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/library/bindings/library_binding.dart';
import '../modules/library/views/library_view.dart';
import '../modules/personal/bindings/personal_binding.dart';
import '../modules/personal/views/personal_view.dart';
import '../modules/plaza/bindings/plaza_binding.dart';
import '../modules/plaza/views/plaza_view.dart';
import '../modules/see_trend/bindings/see_trend_binding.dart';
import '../modules/see_trend/views/see_trend_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PLAZA,
      page: () => const PlazaView(),
      binding: PlazaBinding(),
    ),
    GetPage(
      name: _Paths.LIBRARY,
      page: () => const LibraryView(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.FRIENDS,
      page: () => const FriendsView(),
      binding: FriendsBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL,
      page: () => const PersonalView(),
      binding: PersonalBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => const AddView(),
      binding: AddBinding(),
    ),
    GetPage(
      name: _Paths.SEE_TREND,
      page: () => const SeeTrendView(),
      binding: SeeTrendBinding(),
      transition: Transition.cupertinoDialog,
    ),
  ];
}

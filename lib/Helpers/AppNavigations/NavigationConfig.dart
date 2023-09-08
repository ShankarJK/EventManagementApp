import 'package:firebase/Pages/ChatScreen/ChatScreen.dart';

import '../../Pages/SearchScreen/SearchScreen.dart';
import 'NavigationHelpers.dart';
import '../../Pages/HomeScreen/HomeScreen.dart';

enum Routes {
  HomeScreen,
  SearchScreen,
  ChatScreen,
  ThirdScreen,
  BottomNavScreen
}

class Pages {
  //! Data for Bottom Nav Config
  Object? data;

  //! Screen Config
  static final PageConfig homeScreenConfig = PageConfig(
      route: Routes.HomeScreen,
      build: (_) => HomeScreen(extraData: homeScreenConfig.data));

  static final PageConfig searchScreenConfig = PageConfig(
      route: Routes.SearchScreen,
      build: (_) => SearchScreen(
            userinfo: searchScreenConfig.data,
          ));

  static final PageConfig chatScreenConfig = PageConfig(
      route: Routes.ChatScreen,
      build: (_) => ChatScreen(
            data: chatScreenConfig.data,
          ));
  //! Bottom Nav Config as final not as static
  //late final PageConfig bottomNavScreenConfig = PageConfig(route: Routes.BottomNavScreen, build: (_) => BottomNavigationScreen(extraData: data),
  //  );
}

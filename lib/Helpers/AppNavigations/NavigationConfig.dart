import 'package:gmaps/Pages/MapScreen/MapScreen.dart';

import 'NavigationHelpers.dart';
import '../../Pages/HomeScreen/HomeScreen.dart';

enum Routes {
  HomeScreen,
  MapScreen,
  SecondScreen,
  ThirdScreen,
  BottomNavScreen
}

class Pages{
  //! Data for Bottom Nav Config 
  Object? data; 
   
  //! Screen Config
   static final PageConfig homeScreenConfig = PageConfig( route: Routes.HomeScreen, build: (_) => HomeScreen(extraData: homeScreenConfig.data));

   static final PageConfig mapScreenConfig = PageConfig( route: Routes.MapScreen, build: (_) => MapScreen(locationDetails: mapScreenConfig.data,));

  //! Bottom Nav Config as final not as static
  //late final PageConfig bottomNavScreenConfig = PageConfig(route: Routes.BottomNavScreen, build: (_) => BottomNavigationScreen(extraData: data), 
  //  );
}

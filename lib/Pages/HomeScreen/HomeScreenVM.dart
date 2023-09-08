import 'package:geocoding/geocoding.dart';
import 'package:gmaps/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:gmaps/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:gmaps/Helpers/Utilities/Utilities.dart';
import 'package:gmaps/Pages/HomeScreen/HomeScreenModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Helpers/Mixins/TextFieldMixin.dart';

class HomeScreenVM extends HomeScreenModel {
  // from location textfrom controller
  void getFromText({required String value}) {
    try {
      sourceName = value;
      setAgeFieldValue(event: AddText(data: [sourceName, "from"]));
    } catch (e) {
      e.writeExceptionData();
    }
  }

  // To location textfrom controller
  void getToText({required String value}) {
    try {
      destinationName = value;
      setAgeFieldValue(event: AddText(data: [destinationName, "to"]));
    } catch (e) {
      e.writeExceptionData();
    }
  }

  // void findRoute() {
  //   try {
  //     if (sourceName != "" && destinationName != "") {
  //       navigationStream.add(NavigatorPush(
  //           pageConfig: Pages.mapScreenConfig,
  //           data: [sourceName, destinationName]));
  //     }
  //   } catch (e) {
  //     e.writeExceptionData();
  //   }
  // }

  Future<void> getLatLngFromAddress() async {
    try {
      if (sourceName != "" && destinationName != "") {
        // from location fecthing
        final List<Location> fromlocations =
            await locationFromAddress(sourceName);

        // To location fecthing
        final List<Location> tolocations =
            await locationFromAddress(destinationName);

        if (fromlocations.isNotEmpty && tolocations.isNotEmpty) {
          // from location
          sourceLoction =
              LatLng(fromlocations[0].latitude, fromlocations[0].longitude);
          // to location
          destinationLoction =
              LatLng(tolocations[0].latitude, tolocations[0].longitude);

          // navigate to mapscreen
          navigationStream.add(NavigatorPush(
              pageConfig: Pages.mapScreenConfig,
              data: [sourceLoction, destinationLoction]));
        } else {
          sourceLoction = const LatLng(0, 0);
          destinationLoction = const LatLng(0, 0);
        }
      }
    } catch (e) {
      e.writeExceptionData();
    }
  }
}

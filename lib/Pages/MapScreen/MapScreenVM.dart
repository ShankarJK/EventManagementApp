import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
 import 'package:geolocator/geolocator.dart';
import 'package:gmaps/Helpers/Utilities/Utilities.dart';
import 'package:gmaps/Pages/MapScreen/MapScreenModel.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreenVM extends MapScreenModel {
  // constructor
  MapScreenVM({required List data}) {
    setsourceLoction(data[0]);
    setdestinationLoction(data[1]);
    // getCurrentLocation();
  }

  // declare polyline
  PolylinePoints polylinePoints = PolylinePoints();

  Future<void> getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCfWxm_e83bwjhCUCzoAmRWmnBiUNqu14I",
      PointLatLng(sourceLoction.latitude, sourceLoction.longitude),
      PointLatLng(destinationLoction.latitude, destinationLoction.longitude),
      travelMode: TravelMode.driving,
    );
    print("result:${result.points}");

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  void addPolyLine(List<LatLng> polylineCoordinates) {
    Map<PolylineId, Polyline> polyvalue = {};
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );

    polyvalue[id] = polyline;

    setploylines(polyvalue);
  }

}

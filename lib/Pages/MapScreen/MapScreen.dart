// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:gmaps/Pages/MapScreen/MapScreenVM.dart';
import 'package:image_to_byte/image_to_byte.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:ui' as ui;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.locationDetails});
  final List locationDetails;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // PolylinePoints polylinePoints = PolylinePoints();
  // Map<PolylineId, Polyline> polylines = {};
  var markers;
  var currentIcon;
  late GoogleMapController mapController;
  double zoomLevel = 14.0;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  late final MapScreenVM instance = MapScreenVM(data: widget.locationDetails);

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    _getCurrentLocation();
    addCustomIcon();
  }

  void addCustomIcon() async {
    // markers = await getBytesFromAsset(
    //"lib/Helpers/Resources/Images/google-maps.png", 5);
    var a = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
            "lib/Helpers/Resources/Images/google-maps.png",
            mipmaps: false)
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
          print(icon);
        });
      },
    );

    // current location icon

    ImageConfiguration imageconfig = ImageConfiguration(size: Size(40, 40));
    print("result:");
    print(imageconfig.size);
    var b = await BitmapDescriptor.fromAssetImage(
            imageconfig, "lib/Helpers/Resources/Images/avasoft.jpg",
            mipmaps: false)
        .then(
      (icon) {
        setState(() {
          currentIcon = icon;
          print(icon);
        });
      },
    );
  }

  // location permission
 Future<void> _checkLocationPermission() async {
  if (await Permission.locationWhenInUse.isGranted ||
      await Permission.locationAlways.isGranted) {
    print("Location permission already granted.");
  } else {
    final PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      print("Location permission granted.");
    } else if (status.isDenied) {
      print("Location permission denied.");
    } else if (status.isPermanentlyDenied) {
      print("Location permission permanently denied.");
      openAppSettings(); // Open app settings to allow the user to grant permission manually.
    }
  }
}

  Future<void> _getCurrentLocation() async {
    try {
      late Position locationData;
      locationData = await Geolocator.getCurrentPosition();
      setState(() {
        instance.currentLocation =
            LatLng(locationData.latitude, locationData.longitude);
      });

      Geolocator.getPositionStream().listen((event) {
        setState(() {
          instance.currentLocation = LatLng(event.latitude, event.longitude);
          mapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: instance.currentLocation, zoom: 16)));
        });
      });
    } catch (e) {
      setState(() {
        instance.currentLocation = const LatLng(0.0, 0.0);
      });
    }
  }

//   // set camera location
//   Future<double> _setCameraPosition() async {
//     if (mapController != null) {
//       zoomLevel = await mapController.getZoomLevel();
//       setState(() {
//         mapController.moveCamera(
//           CameraUpdate.newLatLngZoom(instance.sourceLoction, zoomLevel),
//         );
//       });
//     }

//     return zoomLevel;
//   }

// // polylines method
//   getDirections() async {
//     List<LatLng> polylineCoordinates = [];

//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       "AIzaSyBknLOmPWXTYr3hGzQGIIBCnE77p_f4XYs",
//       PointLatLng(
//           instance.sourceLoction.latitude, instance.sourceLoction.longitude),
//       PointLatLng(instance.destinationLoction.latitude,
//           instance.destinationLoction.longitude),
//       travelMode: TravelMode.driving,
//     );

//     print("result:${result.points}");
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     } else {
//       print(result.errorMessage);
//     }
//     addPolyLine(polylineCoordinates);
//   }

//   // add polylines

//   addPolyLine(List<LatLng> polylineCoordinates) {
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: Colors.deepPurpleAccent,
//       points: polylineCoordinates,
//       width: 8,
//     );
//     polylines[id] = polyline;
//     setState(() {});
//   }

  @override
  Widget build(BuildContext context) {
    // instance.getLatLngFromAddress();
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('MapScreen'),
          centerTitle: true,
        ),
        body: instance.sourceLoction != null
            ? Stack(children: [
                GoogleMap(
                  trafficEnabled: true,
                  mapType: MapType.satellite,
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                      // instance.sourceLoction;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                    target: instance.sourceLoction,
                    zoom: zoomLevel,
                  ),
                  markers: {
                    // Marker(
                    //     markerId: const MarkerId("current"),
                    //     position: instance.currentLocation,
                    //     icon: currentIcon),
                    Marker(
                        markerId: const MarkerId("Source"),
                        position: instance.sourceLoction,
                        icon: markerIcon),
                    // Marker(
                    //     markerId: const MarkerId("Destination"),
                    //     position: instance.destinationLoction,
                    //     icon: markerIcon),
                    Marker(
                        markerId: const MarkerId("image_overlay"),
                        position: instance.destinationLoction,
                        icon: currentIcon,)
                  },
                  polylines: {
                    Polyline(
                        zIndex: 0,
                        polylineId: PolylineId("mypolyline"),
                        color: Colors.blue,
                        width: 8,
                        points: [
                          instance.sourceLoction,
                          instance.destinationLoction
                        ])
                  },
                  circles: {
                    Circle(
                      zIndex: 1,
                      circleId: CircleId('circle_marker'),
                      center: instance
                          .currentLocation, // Coordinates of the center of the circle
                      radius: 20, // Radius of the circle in meters
                      fillColor: Colors.black
                          .withOpacity(0.9), // Fill color of the circle
                      strokeWidth: 2, // Width of the circle border
                      strokeColor: Colors.white, // Color of the circle border
                    ),
                  },
                ),
              ])
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}

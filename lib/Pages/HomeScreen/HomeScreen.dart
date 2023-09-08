// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:gmaps/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:gmaps/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:gmaps/Helpers/Mixins/TextFieldMixin.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'HomeScreenVM.dart';

class HomeScreen extends StatefulWidget {
  final dynamic extraData;
  const HomeScreen({
    Key? key,
    required this.extraData,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenVM instance = HomeScreenVM();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  @override
  void initState() {
    super.initState();

    // navigation push
    instance.navigationStream.stream.listen((event) {
      if (event is NavigatorPush) {
        context.push(pageConfig: event.pageConfig, data: event.data);
      }
    });

    // text field contreoller listner
    instance.ageFieldController.stream.listen((event) {
      if (event is AddText) {
        switch (event.data[1]) {
          case "from":
            {
              fromController.text = event.data[0];
              fromController.selection =
                  TextSelection.collapsed(offset: instance.sourceName.length);
              break;
            }
          case "to":
            {
              toController.text = event.data[0];
              toController.selection = TextSelection.collapsed(
                  offset: instance.destinationName.length);
              break;
            }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Text("From:"),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  width: 250,
                  child: TextFormField(
                    onChanged: (text) => (instance.getFromText(value: text)),
                    controller: fromController,
                    decoration: const InputDecoration(
                      filled: true,
                      //   fillColor: Color.fromARGB(160, 255, 255, 255),
                      //  // fillColor: const Color(0xffeaecef),
                      hintText: "From",
                      contentPadding: EdgeInsets.only(
                        left: 30,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Text("To:"),
                const SizedBox(
                  width: 60,
                ),
                Container(
                  width: 250,
                  child: TextFormField(
                    onChanged: (text) => (instance.getToText(value: text)),
                    controller: toController,
                    decoration: const InputDecoration(
                      filled: true,
                      //   fillColor: Color.fromARGB(160, 255, 255, 255),
                      //  // fillColor: const Color(0xffeaecef),
                      hintText: "To",
                      contentPadding: EdgeInsets.only(
                        left: 30,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: instance.getLatLngFromAddress,
                    child: const Text("Find Route")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Open Map")),
              ],
            ),
          )
        ],
      )),
    );
  }
}

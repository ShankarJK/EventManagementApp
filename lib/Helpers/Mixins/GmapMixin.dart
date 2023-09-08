// ignore_for_file: file_names

import 'dart:async';


abstract class IGmap {}

class AddCurrentLocation extends IGmap {
  var data;
  AddCurrentLocation({required this.data});
}

mixin TextFieldMixin {

  StreamController<IGmap?> currentLocationStream =
      StreamController<IGmap?>();

   
  void onchanged({required IGmap event}) {
    currentLocationStream.add(event);
  }



  void closeMapMixin() async {
    await currentLocationStream.close();
  }

}


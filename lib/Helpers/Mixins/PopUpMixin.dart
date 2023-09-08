// ignore_for_file: file_names

import 'dart:async';

/* Create an IPopUp abstract class */
abstract class IPopUp {
}

// Create ShowPopUp class to show popup to the user
class ShowPopUp extends IPopUp {
  String popUpName;
  ShowPopUp({required this.popUpName});
}
// Create a mixin PopUpMixin and have a streamcontroller and method to add and dispose events and controller
mixin PopUpMixin {

  // Initailize a streamController to listen the emitted events
  StreamController<IPopUp> popUpController =
      StreamController<IPopUp>();

  /* Create setToastEvent method and add the event into the StreamController variable "popUpController" */
  void setToastEvent({required IPopUp event}) {
    // Add event inside the stream
    popUpController.add(event);
  }

  /* Create closeToastMixin method to close the popUpController*/
  void closeToastMixin() async {
    
    //  Stop the stream listeneing using close function
    await popUpController.close();
  }
}


import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'MapScreenModel.g.dart';

class MapScreenModel = _MapScreenModelBase with _$MapScreenModel;

abstract class _MapScreenModelBase with Store {
  String sourceName = "";

  String destinationName = "";

  @observable
  LatLng sourceLoction = LatLng(0, 0);

  @action
  void setsourceLoction(LatLng source) {
    sourceLoction = source;
  }

  @observable
  LatLng destinationLoction = LatLng(0, 0);

  @action
  void setdestinationLoction(LatLng destination) {
    destinationLoction = destination;
  }

  @observable
  Map<PolylineId, Polyline> polylines = {};

  @action
  void setploylines(Map<PolylineId, Polyline> values) {
    polylines = values;
  }

  @observable
  LatLng currentLocation = LatLng(0, 0);

  @action
  void setcurrentLocation(LatLng current) {
    currentLocation = current;
  }
}

import 'package:gmaps/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:gmaps/Helpers/Mixins/TextFieldMixin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'HomeScreenModel.g.dart';

class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel;

abstract class _HomeScreenModelBase
    with Store, NavigationMixin, TextFieldMixin {
  @observable
  String sourceName = "";

  @observable
  String destinationName = "";

  @action
  void setSourceName(String sourceName) {
    this.sourceName = sourceName;
  }

  @action
  void setDestinationName(String destinationName) {
    this.destinationName = destinationName;
  }

  LatLng sourceLoction = LatLng(0, 0);

  LatLng destinationLoction = LatLng(0, 0);
}

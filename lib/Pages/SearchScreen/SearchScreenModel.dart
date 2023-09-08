import 'package:firebase/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:firebase/Helpers/Mixins/TextFieldMixin.dart';
import 'package:mobx/mobx.dart';
part 'SearchScreenModel.g.dart';

class SearchScreenModel = _SearchScreenModelBase with _$SearchScreenModel;

abstract class _SearchScreenModelBase
    with Store, NavigationMixin, TextFieldMixin {
  @observable
  dynamic currentUserinfo = "";

  @action
  setCurrentUserinfo(dynamic value) {
    this.currentUserinfo = value;
  }

  Map<String, dynamic> userMap = {};

  @action
  setUserMap(Map<String, dynamic> userMap) {
    this.userMap = userMap;
  }

  String searchtext = "";

  @action
  setsearchtext(String searchtext) {
    this.searchtext = searchtext;
  }

  @observable
  bool isUser = false;

  @action
  setIsUser(bool isUser) {
    this.isUser = isUser;
  }
}

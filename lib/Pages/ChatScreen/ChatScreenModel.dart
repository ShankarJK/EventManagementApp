import 'package:firebase/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:firebase/Helpers/Mixins/TextFieldMixin.dart';
import 'package:mobx/mobx.dart';
part 'ChatScreenModel.g.dart';

class ChatScreenModel = _ChatScreenModelBase with _$ChatScreenModel;

abstract class _ChatScreenModelBase
    with Store, NavigationMixin, TextFieldMixin {
  @observable
  String status = "";

  @action
  setStatus(String status) {
    this.status = status;
  }

  Map<String, dynamic> userMap = {};

  @action
  setUserMap(Map<String, dynamic> userMap) {
    this.userMap = userMap;
  }

  String chatMessage = "";

  @action
  setChatMessage(String chatMessage) {
    this.chatMessage = chatMessage;
  }
}

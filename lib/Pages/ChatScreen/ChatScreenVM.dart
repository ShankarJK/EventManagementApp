import 'package:firebase/Helpers/Utilities/Utilities.dart';

import '../../Helpers/AppNavigations/NavigationMixin.dart';
import '../../Helpers/Mixins/TextFieldMixin.dart';
import 'ChatScreenModel.dart';

class ChatScreenVM extends ChatScreenModel {
  var chatRoomId;

  ChatScreenVM(List value) {
    setUserMap(value[1]);
    print("usermap : $userMap");

    chatRoomId = value[0];
    print("chatroomid : $chatRoomId");
  }

  void getChatText(String value) {
    try {
      chatMessage = value;
      setNameFieldValue(event: AddText(data: [chatMessage, "chat"]));
    } catch (e) {
      e.writeExceptionData();
    }
  }

  void navigatetoSearchScreen() {
    try {
      navigationStream.add(NavigatorPop());
    } catch (e) {
      e.writeExceptionData();
    }
  }
}

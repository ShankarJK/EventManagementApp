import 'package:firebase/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:firebase/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:firebase/Helpers/Utilities/Utilities.dart';
import 'package:firebase/Pages/SearchScreen/SearchScreenModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Helpers/Mixins/TextFieldMixin.dart';

class SearchScreenVM extends SearchScreenModel {
  SearchScreenVM(dynamic userinfo) {
    this.currentUserinfo = userinfo;
  }

  void searchUsers() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      if (searchtext != "") {
        await firestore
            .collection("users")
            .where("email", isEqualTo: searchtext)
            .get()
            .then((value) => setUserMap(value.docs[0].data()));

        setIsUser(true);

        print("---------------------");
        print(userMap);

        print(userMap['email']);
      }
    } catch (e) {
      e.writeExceptionData();
    }
  }

  String createChatRoom(String user1, String user2) {
  
    print(user1[0].toLowerCase().codeUnits[0]);
    print(user2[0].toLowerCase().codeUnits[0]);

    if (user1[0].toLowerCase().codeUnits[0] >
        user2[0].toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void getSearchText(String value) {
    try {
      searchtext = value;
      setNameFieldValue(event: AddText(data: [searchtext, "search"]));
    } catch (e) {
      e.writeExceptionData();
    }
  }

  void navigatetoChatScreen() async {
    try {
      print(currentUserinfo.displayName);
      print(userMap["username"]);
      final roomId = await createChatRoom(
          currentUserinfo.displayName, userMap["username"]);
      navigationStream.add(NavigatorPush(
          pageConfig: Pages.chatScreenConfig, data: [roomId, userMap]));
    } catch (e) {
      e.writeExceptionData();
    }
  }
}

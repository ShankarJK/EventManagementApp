import 'package:firebase/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:firebase/Helpers/Mixins/TextFieldMixin.dart';
import 'package:flutter/material.dart';
import '../../Helpers/AppNavigations/NavigationMixin.dart';
import "SearchScreenVM.dart";
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.userinfo});

  final userinfo;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchScreenVM instance = SearchScreenVM(widget.userinfo);

  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    instance.nameFieldController.stream.listen((event) {
      if (event is AddText) {
        switch (event.data[1]) {
          case ("search"):
            searchController.text = instance.searchtext;
            searchController.selection =
                TextSelection.collapsed(offset: instance.searchtext.length);
            break;
        }
      }
    });

    instance.navigationStream.stream.listen((event) {
      if (event is NavigatorPush) {
        context.push(pageConfig: event.pageConfig, data: event.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SearchScreen"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            TextField(
              onChanged: (text) => (instance.getSearchText(text)),
              controller: searchController,
              decoration: InputDecoration(
                fillColor: Colors.black,
                hintText: "Search a friend",
                border: OutlineInputBorder(),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              onPressed: () {
                instance.searchUsers();
              },
              child: Text(
                "Search",
                // style: TextStyle(color: Colors.pink),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink[100]),
              ),
            ),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return Visibility(
                visible: instance.isUser,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(instance.userMap['username']),
                        subtitle: Text(instance.userMap['email']),
                        trailing: Icon(Icons.message),
                        onTap: instance.navigatetoChatScreen,
                      );
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

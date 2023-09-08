// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names

import 'package:firebase/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:firebase/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:firebase/Helpers/Utilities/Utilities.dart';
import 'package:firebase/Pages/HomeScreen/HomeScreenVM.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uni_links/uni_links.dart';

class HomeScreen extends StatefulWidget {
  final dynamic extraData;
  const HomeScreen({
    Key? key,
    required this.extraData,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  HomeScreenVM instance = HomeScreenVM();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    instance.navigationStream.stream.listen((event) {
      if (event is NavigatorPush) {
        context.push(pageConfig: event.pageConfig, data: event.data);
      }
    });

    uriLinkStream.listen((Uri? uri) {
      if (uri != "") {
        print("uri $uri");
        instance.passwordLessAuth(uri!);
      }
    });

    getInitialLink();
  }

  Future<void> getInitialLink() async {
    try {
      // Listen for initial link events
      Uri? initialLink = await getInitialUri();
      print("__________________check");
      print(initialLink?.toString() ?? '');

      var link = initialLink?.toString() ?? '';

      if (link != "") {
        print("link $link");
      }
    } catch (e) {
      print('Error getting initial link: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Text("username:"),
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    width: 220,
                    child: TextFormField(
                      onChanged: (text) => (instance.getname(value: text)),
                      controller: usernameController,
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: "username",
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
                  const Text("password:"),
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    width: 220,
                    child: TextFormField(
                      onChanged: (text) => (instance.getpassword(value: text)),
                      controller: passController,
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: "password",
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
                      onPressed: instance.loginWithFirebase,
                      child: const Text("login")),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: instance.signoutWithFirebase,
                      child: const Text("logout")),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: instance.emailVerification,
                      child: const Text("verify email")),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: instance.signupWithFirebase,
                      child: const Text("sign up")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: instance.resetPasswordWithEmail,
                      child: const Text("Reset password")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: instance.passwordlessLogin,
                      child: const Text("magic link")),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: instance.signinWithGoogle,
                      child: const Text("Google signin")),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  // ElevatedButton(
                  //     onPressed: instance.resetPasswordWithEmail,
                  //     child: const Text("Reset password")),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  // ElevatedButton(
                  //     onPressed: instance.passwordlessLogin,
                  //     child: const Text("magic link")),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Observer(builder: (_) {
                return Text("Status: ${instance.status}");
              }),
            )
          ],
        )),
      ),
    );
  }
}

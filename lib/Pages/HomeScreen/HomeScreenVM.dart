import 'package:firebase/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:firebase/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:firebase/Helpers/Utilities/Utilities.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Helpers/Mixins/TextFieldMixin.dart';
import 'HomeScreenModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class HomeScreenVM extends HomeScreenModel {
  // Declare a method getname for textcontroller of username
  void getname({required String value}) {
    try {
      username = value;
      setAgeFieldValue(event: AddText(data: [username, "username"]));
    } catch (e) {
      e.writeExceptionData();
    }
  }5

  // Declare a method getpassword for textcontroller of password
  void getpassword({required String value}) {
    try {
      password = value;
      setAgeFieldValue(event: AddText(data: [password, "password"]));
    } catch (e) {
      e.writeExceptionData();
    }
  }

  // Declare a method loginWithFirebase for login

  Future<void> loginWithFirebase() async {
    try {
      if (username != "" && password != "") {
        var response = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: username, password: password);

        if (response.user != null) {
          setStatus("${response.user!.email} was logined ");

          navigationStream.add(NavigatorPush(
              pageConfig: Pages.searchScreenConfig, data: response.user));

          print("${response.user!.email} was logined ");
        }
      }
    } on FirebaseAuthException catch (e) {
      setStatus(e.toString());
      e.writeExceptionData();
    }
  }

  // Declare a method signoutWithFirebase for signout

  Future<void> signoutWithFirebase() async {
    try {
      var lastuser = FirebaseAuth.instance.currentUser!.email;
      await FirebaseAuth.instance.signOut();

      if (FirebaseAuth.instance.currentUser == null) {
        setStatus("${lastuser} was logouted ");
        print("${lastuser} was logouted ");
      }
    } on FirebaseAuthException catch (e) {
      setStatus(e.toString());
      e.writeExceptionData();
    }
  }

  // Declare a method signupWithFirebase for account creation with flutter
  Future<void> signupWithFirebase() async {
    try {
      FirebaseAuth fireauth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      if (username != "" && password != "") {
        // user creation
        var response = await fireauth.createUserWithEmailAndPassword(
          email: username,
          password: password,
        );

        if (response.user != null) {
          setStatus("${response.user!.email} was created ");

          // regex to set the name these is dummy for now
          String? email = response.user!.email;
          RegExp regex = RegExp(r"^(.*?)@");
          RegExpMatch? match = regex.firstMatch(email!);
          String? name = match != null ? match.group(1) : null;
          print(name);

          // user is logined in
          var loginresponse = await fireauth.signInWithEmailAndPassword(
              email: username, password: password);

          if (fireauth.currentUser != null) {
            print("loginned");
            // update user name
            await fireauth.currentUser!.updateDisplayName(name);
          }

          print("_________________displayname");
          print(fireauth.currentUser!.displayName);

          // store the user values in db
          await firestore.collection("users").doc(response.user!.uid).set({
            "username": fireauth.currentUser!.displayName,
            "email": fireauth.currentUser!.email,
            "uid": fireauth.currentUser!.uid
          });

          // signoutted the user
          await fireauth.signOut();
          print("logouted");
          print("${response.user!.email} was created ");
        }
      }
    } on FirebaseAuthException catch (e) {
      setStatus(e.toString());
      e.writeExceptionData();
    }
  }

  // Declare a method resetPasswordWithEmail for resetting a password with email
  Future<void> resetPasswordWithEmail() async {
    try {
      if (username != "") {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: username);
        setStatus("reset password link sent");
        print("rest password link is sent to email ");
      }
    } on FirebaseAuthException catch (e) {
      setStatus(e.toString());
      e.writeExceptionData();
    }
  }

  // Declare a method emailVerfification for emailVerfifcation using email

  Future<void> emailVerification() async {
    try {
      if (username != "" && password != "") {
        var emailResponse = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: username, password: password);

        if (emailResponse.user != null) {
          await FirebaseAuth.instance.currentUser!.sendEmailVerification;
          setStatus("Verify email link is sent to the email");
          print("Verify email link is sent to the email ");
        }
      }
    } on FirebaseAuthException catch (e) {
      setStatus(e.toString());
      e.writeExceptionData();
    }
  }

  // Declare a method passwordlessLogin for magiclink
  Future<void> passwordlessLogin() async {
    try {
      if (username != "") {
        var reponse = await FirebaseAuth.instance.sendSignInLinkToEmail(
          email: username,
          actionCodeSettings: ActionCodeSettings(
              url:
                  'https://www.example.com/cart?email=user@example.com&cartId=123',
              androidPackageName: 'com.example.firebase',
              iOSBundleId: 'com.example.firebase',
              handleCodeInApp: true,
              androidMinimumVersion: '1',
              androidInstallApp: true),
        );
        setStatus("magic link sent to email successfully");
        print("magic link sent to email successfully");
      }
    } on FirebaseAuthException catch (e) {
      setStatus(e.toString());
      e.writeExceptionData();
    }
  }

  //Declare a method signinwithGoogle for google signin

  Future<void> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
          idToken: gAuth.idToken, accessToken: gAuth.accessToken);

      var gresponse =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (gresponse.user != null) {
        setStatus(
            "successfully signned with gmail using ${gresponse.user!.email}");
        print("magic link sent to email successfully");
      }
    } catch (e) {
      e.writeExceptionData();
    }
  }

  // Declare a method handleLink()
  void handleLink(Uri link, userEmail) async {
    if (link != null) {
      print(userEmail);
      final UserCredential user =
          await FirebaseAuth.instance.signInWithEmailLink(
        email: userEmail,
        emailLink: link.toString(),
      );

      if (user != null) {
        setStatus("${user.user!.email} is logined with magiclink");
        print(user.user!.email);
      }
    } else {
      print("link is null");
    }
  }

  Future<void> passwordLessAuth(Uri url) async {
    try {
      String? token = url.queryParameters['token'];
      print("token $token!");

      final Dio _dio =
          Dio(BaseOptions(baseUrl: 'http://192.168.43.6:7747/api/auth/'));

      var responses = await _dio.get("login?token=${token!}");

      if (responses.statusCode == 200) {
        print(responses.data);

        //  navigationStream.add(NavigatorPush(
        //       pageConfig: Pages.searchScreenConfig, data: response.user));
      } else {
        setStatus(responses.data);
      }
    } catch (e) {
      e.writeExceptionData();
    }
  }
}

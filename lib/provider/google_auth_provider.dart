import 'dart:convert';

import 'package:docs_clone_flutter/constants.dart';
import 'package:docs_clone_flutter/models/error_model.dart';
import 'package:docs_clone_flutter/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart';

import '../screens/home_screen.dart';

final gAuthProvider = Provider(
  (ref) => GauthProvider(client: Client()),
);
final userProvider = StateProvider<UserModel?>((ref) => null);

class GauthProvider {
  String? imageurl;
  final Client _client;

  final FirebaseAuth fireauth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  GauthProvider({
    required Client client,
  }) : _client = client;

  String? get Imageurl {
    return imageurl;
  }

  Future<ErrorModel> signUpWithGoogle(
    BuildContext context,
  ) async {
    ErrorModel error = ErrorModel(data: null, error: "error occor");
    if (kIsWeb) {
      //if it is website
      GoogleAuthProvider gAuthProvider = GoogleAuthProvider();

      UserCredential result = await fireauth.signInWithPopup(gAuthProvider);
      var userdata = result.user!;
      print(userdata.email);

      final newUser = UserModel(
          useremail: userdata.email.toString(),
          username: userdata.displayName.toString(),
          userprofilepic: userdata.photoURL.toString(),
          uid: userdata.uid,
          utoken: "");

      print("**********");
      print(newUser.useremail);
      // print(newUser.toJson());

      // final signupUrl = Uri.parse('$host/api/signup');

      // final res = await http.post(signupUrl, headers: {
      //   'Content-Type': ' application/json; charset=UTF-8'
      // }, body: {

      //     "username": newUser.username,
      //     "useremail": newUser.useremail,
      //     "userprofilepic": newUser.userprofilepic,

      // });

    } else {
      //mobile divice
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      // in try
      try {
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;
          final AuthCredential authCredential = GoogleAuthProvider.credential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken);

          // Getting users credential
          UserCredential result =
              await fireauth.signInWithCredential(authCredential);

          // print(result.user!);
          // print("*********");
          // print(result.user!.email.toString());
          // // print(result.user!.phoneNumber.toString());
          // // print(result.user!.emailVerified.toString());
          // print(result.user!.photoURL);
          // print(result.user!.uid);
          // imageurl = result.user!.photoURL;

          var userdata = result.user!;

          final newUser = UserModel(
              useremail: userdata.email.toString(),
              username: userdata.displayName.toString(),
              userprofilepic: userdata.photoURL.toString(),
              uid: userdata.uid,
              utoken: "");

          print(newUser.toJson());
          print("-----------");

          final signupUrl = Uri.parse(host + '/api/signup');
          print(signupUrl);
          var res = await _client.post(
            signupUrl,
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: newUser.toJson(),
          );
          switch (res.statusCode) {
            case 200:
              final newnewuser =
                  newUser.copyWith(uid: jsonDecode(res.body)['user']["_id"]);
              error = ErrorModel(data: newnewuser, error: null);
              break;
          }
          print(jsonDecode(res.body));
        }
      } catch (e) {
        error = ErrorModel(data: null, error: e.toString());
      }

      //in catch block

    }
    return error;
  }

  void signOutWithGoogle() {
    // Sign out with firebase
    // Sign out with google
    googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
  }
}

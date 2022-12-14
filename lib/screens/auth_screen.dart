import 'dart:async';

import 'package:docs_clone_flutter/widget/signup_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../provider/google_auth_provider.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);

  void handlerGoogleSignup(WidgetRef ref, BuildContext context) async {
    final sMessenger =
        ScaffoldMessenger.of(context); //context is use before await
    final errormodel = await ref.watch(gAuthProvider).signUpWithGoogle(context);
    print(errormodel.error);
    print(errormodel.data);

    if (errormodel.error == null) {
      //no error is there
      //done -- data has hold logedin user details
      //put logedin user info to userprovider
      //userprovider is userModel class
      ref.watch(userProvider.notifier).update((State) => errormodel.data);
     
    } else {
      // error is there
      
      sMessenger.showSnackBar(SnackBar(content: Text(errormodel.error!)));
    }
    print("***(((((((*********");
    print(ref.watch(userProvider)!.username);
    print(ref.watch(userProvider)!.useremail);
    print(ref.watch(userProvider)!.uid);
    print("***(((((((*********");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //WidgetRef is used to interact with widget
    //providerRef is used to interact with provider

    //now we read or watch from provider

    final mxheight = MediaQuery.of(context).size.height;
    final mxwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => handlerGoogleSignup(ref, context),
              child: SignupCard(
                mxheight: mxheight,
                mxwidth: mxwidth,
                title: "Signup with Google",
                imagepath: "assets/images/g-logo-2.png",
              ),
            ),
            // InkWell(
            //   onTap: () => onSubmitAppleSignup(context),
            //   child: SignupCard(
            //     mxheight: mxheight,
            //     mxwidth: mxwidth,
            //     title: "Signup with Apple",
            //     imagepath: "assets/images/g-logo-2.png",
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}

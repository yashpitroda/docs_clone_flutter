import 'package:docs_clone_flutter/provider/google_auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void handlerSignOut(WidgetRef ref) {
    ref.read(gAuthProvider).signOutWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(onTap: () => handlerSignOut(ref), child: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          (ref.watch(userProvider) != null)
              ? Column(
                  children: [
                    Image.network(ref.watch(userProvider)!.userprofilepic),
                    Center(child: Text(ref.watch(userProvider)!.username)),
                    Center(child: Text(ref.watch(userProvider)!.useremail)),
                  ],
                )
              : Center(
                  child: Text("data is not fund"),
                )
        ],
      ),
    );
  }
}

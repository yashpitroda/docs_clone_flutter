import 'package:docs_clone_flutter/provider/google_auth_provider.dart';
import 'package:docs_clone_flutter/screens/auth_screen.dart';
import 'package:docs_clone_flutter/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance
            .authStateChanges(), //it give a token whter it is authenticed or not
        builder: (context, userSnapshot) {
          if (userSnapshot.hasData) {
            //if data is found mean userr authanticated so we go to homescreeen
            return HomeScreen();
          } else {
            //and no data so not auth.. so retry
            return AuthScreen();
          }
          //  if (!(userSnapshot.hasData) && (ref.watch(userProvider)==null)) {
          //   //if data is found mean userr authanticated so we go to homescreeen
          //   return AuthScreen();
          // } else {
          //   //and no data so not auth.. so retry
          //   return HomeScreen();
          // }

        },
      ),
    );
  }
}

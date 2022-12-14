// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBFWPXMSBJaD7KmpWEbtOlc8A0MJQn0DR0',
    appId: '1:507110306256:web:a24612bea6f0a9f76249d5',
    messagingSenderId: '507110306256',
    projectId: 'docs-clone-65f99',
    authDomain: 'docs-clone-65f99.firebaseapp.com',
    storageBucket: 'docs-clone-65f99.appspot.com',
    measurementId: 'G-K2G813VWEZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3oiuC6tK7Gwo3-BunFw-fjehRGtPS62g',
    appId: '1:507110306256:android:524a12502cc65a056249d5',
    messagingSenderId: '507110306256',
    projectId: 'docs-clone-65f99',
    storageBucket: 'docs-clone-65f99.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkpcZgwwV2gIvJ5HL1GpyVwIGJu1NbzyA',
    appId: '1:507110306256:ios:a4aeb1f0bdc1a5b06249d5',
    messagingSenderId: '507110306256',
    projectId: 'docs-clone-65f99',
    storageBucket: 'docs-clone-65f99.appspot.com',
    iosClientId: '507110306256-loidr1nr5q3k2g4si91eogpg1lnrmh9g.apps.googleusercontent.com',
    iosBundleId: 'com.example.docsCloneFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCkpcZgwwV2gIvJ5HL1GpyVwIGJu1NbzyA',
    appId: '1:507110306256:ios:a4aeb1f0bdc1a5b06249d5',
    messagingSenderId: '507110306256',
    projectId: 'docs-clone-65f99',
    storageBucket: 'docs-clone-65f99.appspot.com',
    iosClientId: '507110306256-loidr1nr5q3k2g4si91eogpg1lnrmh9g.apps.googleusercontent.com',
    iosBundleId: 'com.example.docsCloneFlutter',
  );
}
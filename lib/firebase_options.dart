// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAL1VDS1LTLwpSyJXHK5ClXmg7QxXNivqE',
    appId: '1:54653464917:web:84bb1db9a6290e83937fdc',
    messagingSenderId: '54653464917',
    projectId: 'bookly-41368',
    authDomain: 'bookly-41368.firebaseapp.com',
    storageBucket: 'bookly-41368.appspot.com',
    measurementId: 'G-8S38CGCCZ4',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8HSYErxp12kpm1c1uKLtYEn54dWWT-PE',
    appId: '1:54653464917:ios:b7e6c614a33f796f937fdc',
    messagingSenderId: '54653464917',
    projectId: 'bookly-41368',
    storageBucket: 'bookly-41368.appspot.com',
    iosBundleId: 'com.example.book',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8HSYErxp12kpm1c1uKLtYEn54dWWT-PE',
    appId: '1:54653464917:ios:b7e6c614a33f796f937fdc',
    messagingSenderId: '54653464917',
    projectId: 'bookly-41368',
    storageBucket: 'bookly-41368.appspot.com',
    iosBundleId: 'com.example.book',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAL1VDS1LTLwpSyJXHK5ClXmg7QxXNivqE',
    appId: '1:54653464917:web:eb61fb4ad19d006c937fdc',
    messagingSenderId: '54653464917',
    projectId: 'bookly-41368',
    authDomain: 'bookly-41368.firebaseapp.com',
    storageBucket: 'bookly-41368.appspot.com',
    measurementId: 'G-15CZ3LB7DY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqHEmxP95H308EK9nTdO5IeWd2ykpPHYc',
    appId: '1:54653464917:android:0d377b51d17ef453937fdc',
    messagingSenderId: '54653464917',
    projectId: 'bookly-41368',
    storageBucket: 'bookly-41368.appspot.com',
  );

}
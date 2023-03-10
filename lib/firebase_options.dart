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
    apiKey: 'AIzaSyAtO58N54CP91lPG3e69SQyXzMAojEjduI',
    appId: '1:885943130156:web:dbfb4c6ecf3de016c25989',
    messagingSenderId: '885943130156',
    projectId: 'fireflutter-570f8',
    authDomain: 'fireflutter-570f8.firebaseapp.com',
    storageBucket: 'fireflutter-570f8.appspot.com',
    measurementId: 'G-1YHRDRS61S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmLZWw8VcRsvRDWmcmlEMk-6zPaRMlzlw',
    appId: '1:885943130156:android:90b1cdcabd100839c25989',
    messagingSenderId: '885943130156',
    projectId: 'fireflutter-570f8',
    storageBucket: 'fireflutter-570f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRtuI8W_cstHwqdO44GRFo4dbOqNQYU9o',
    appId: '1:885943130156:ios:83b5555ee8d00236c25989',
    messagingSenderId: '885943130156',
    projectId: 'fireflutter-570f8',
    storageBucket: 'fireflutter-570f8.appspot.com',
    iosClientId: '885943130156-1p9064jdgj009dujs1ht6fcqetakqkfr.apps.googleusercontent.com',
    iosBundleId: 'com.example.fireflutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRtuI8W_cstHwqdO44GRFo4dbOqNQYU9o',
    appId: '1:885943130156:ios:83b5555ee8d00236c25989',
    messagingSenderId: '885943130156',
    projectId: 'fireflutter-570f8',
    storageBucket: 'fireflutter-570f8.appspot.com',
    iosClientId: '885943130156-1p9064jdgj009dujs1ht6fcqetakqkfr.apps.googleusercontent.com',
    iosBundleId: 'com.example.fireflutter',
  );
}

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
    apiKey: "api key",
    appId: "app id",
    messagingSenderId: '304114125569',
    projectId: 'we-chat-e1d5c',
    authDomain: 'we-chat-e1d5c.firebaseapp.com',
    storageBucket: 'we-chat-e1d5c.appspot.com',
    measurementId: 'G-P5WM56CKD5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "api key",
    appId: "app id",
    messagingSenderId: '304114125569',
    projectId: 'we-chat-e1d5c',
    storageBucket: 'we-chat-e1d5c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "api key",
    appId: "app id",
    messagingSenderId: '304114125569',
    projectId: 'we-chat-e1d5c',
    storageBucket: 'we-chat-e1d5c.appspot.com',
    androidClientId: '304114125569-th50d6m1ug6jcu3iehharbn1d8aairdm.apps.googleusercontent.com',
    iosClientId: '304114125569-fhi94sjlmv6ugghkeq5d3ui37bs83qvs.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatAppication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "api key",
    appId: "app id",
    messagingSenderId: '304114125569',
    projectId: 'we-chat-e1d5c',
    storageBucket: 'we-chat-e1d5c.appspot.com',
    androidClientId: '304114125569-th50d6m1ug6jcu3iehharbn1d8aairdm.apps.googleusercontent.com',
    iosClientId: '304114125569-m5i20p1ctor2h9pi26fsrdfhq018puu5.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatAppication.RunnerTests',
  );
}
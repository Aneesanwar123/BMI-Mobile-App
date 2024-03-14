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
    apiKey: 'AIzaSyCD6pXOMCie9iOHX6SSCFm1UOQ4m5rwRy0',
    appId: '1:384074824247:web:67f212239e75cd5ec0ddb2',
    messagingSenderId: '384074824247',
    projectId: 'intern-1081f',
    authDomain: 'intern-1081f.firebaseapp.com',
    storageBucket: 'intern-1081f.appspot.com',
    measurementId: 'G-F5DJXNE6KM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB91D2MFgn4rRGh9w0nUmf-g_YtVmo-csA',
    appId: '1:384074824247:android:041f969ee438d0eec0ddb2',
    messagingSenderId: '384074824247',
    projectId: 'intern-1081f',
    storageBucket: 'intern-1081f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQbwjwJwhodYLL28La0S1JkXmZF3Jo-mA',
    appId: '1:384074824247:ios:50ba291471dd77c8c0ddb2',
    messagingSenderId: '384074824247',
    projectId: 'intern-1081f',
    storageBucket: 'intern-1081f.appspot.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQbwjwJwhodYLL28La0S1JkXmZF3Jo-mA',
    appId: '1:384074824247:ios:14d4de2a7884ae5fc0ddb2',
    messagingSenderId: '384074824247',
    projectId: 'intern-1081f',
    storageBucket: 'intern-1081f.appspot.com',
    iosBundleId: 'com.example.myApp.RunnerTests',
  );
}

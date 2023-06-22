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
    apiKey: 'AIzaSyDiGojITG2MmMj2dKbT0h_0aRQ5BSD9oEo',
    appId: '1:32168159957:web:de27ed0c10433fc029d05c',
    messagingSenderId: '32168159957',
    projectId: 'camera-app-91adf',
    authDomain: 'camera-app-91adf.firebaseapp.com',
    storageBucket: 'camera-app-91adf.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBI_f_NnaQYoPnlfGUAH6-U4inqmFV3wbs',
    appId: '1:32168159957:android:03d09ea16f9b8e7329d05c',
    messagingSenderId: '32168159957',
    projectId: 'camera-app-91adf',
    storageBucket: 'camera-app-91adf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvRwYarrNDpn3u56wWZfUwVW6XXAJsBpo',
    appId: '1:32168159957:ios:1642187f4ce2151729d05c',
    messagingSenderId: '32168159957',
    projectId: 'camera-app-91adf',
    storageBucket: 'camera-app-91adf.appspot.com',
    androidClientId: '32168159957-9qe5v2ci0ru6j5tou10h7cmej6osjo1g.apps.googleusercontent.com',
    iosClientId: '32168159957-23t6rb2ocefug0s8e582ahkpmlm5mlk7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flyinSocialMediaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvRwYarrNDpn3u56wWZfUwVW6XXAJsBpo',
    appId: '1:32168159957:ios:1642187f4ce2151729d05c',
    messagingSenderId: '32168159957',
    projectId: 'camera-app-91adf',
    storageBucket: 'camera-app-91adf.appspot.com',
    androidClientId: '32168159957-9qe5v2ci0ru6j5tou10h7cmej6osjo1g.apps.googleusercontent.com',
    iosClientId: '32168159957-23t6rb2ocefug0s8e582ahkpmlm5mlk7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flyinSocialMediaApp',
  );
}
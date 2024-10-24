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
    apiKey: 'AIzaSyB1MEPwhUCeQWaeJQ46UsBOQaTumxhXRjk',
    appId: '1:498792436096:web:984edf243efd5dbbe53165',
    messagingSenderId: '498792436096',
    projectId: 'debtsclients',
    authDomain: 'debtsclients.firebaseapp.com',
    storageBucket: 'debtsclients.appspot.com',
    measurementId: 'G-T4E2WP1T4C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwPray9fvunZsrpEp6yfJBEShpGPNf7YY',
    appId: '1:498792436096:android:3a7c8b2b7b947cdee53165',
    messagingSenderId: '498792436096',
    projectId: 'debtsclients',
    storageBucket: 'debtsclients.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEoNRYccildMEmvoq4TJxO6RDa1lXU5-k',
    appId: '1:498792436096:ios:ee0956d4bf87480ee53165',
    messagingSenderId: '498792436096',
    projectId: 'debtsclients',
    storageBucket: 'debtsclients.appspot.com',
    iosBundleId: 'com.example.clientsDebts',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEoNRYccildMEmvoq4TJxO6RDa1lXU5-k',
    appId: '1:498792436096:ios:ee0956d4bf87480ee53165',
    messagingSenderId: '498792436096',
    projectId: 'debtsclients',
    storageBucket: 'debtsclients.appspot.com',
    iosBundleId: 'com.example.clientsDebts',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB1MEPwhUCeQWaeJQ46UsBOQaTumxhXRjk',
    appId: '1:498792436096:web:e59b223b0788cb2ae53165',
    messagingSenderId: '498792436096',
    projectId: 'debtsclients',
    authDomain: 'debtsclients.firebaseapp.com',
    storageBucket: 'debtsclients.appspot.com',
    measurementId: 'G-KTNN0HS2X3',
  );
}

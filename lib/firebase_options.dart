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
    apiKey: 'AIzaSyAlPf29itctx6XJ84ESYmIBDMwV_VKSyrM',
    appId: '1:264286272522:web:ac308477878b527642f3f3',
    messagingSenderId: '264286272522',
    projectId: 'tinhtoandidong-d59ac',
    authDomain: 'tinhtoandidong-d59ac.firebaseapp.com',
    storageBucket: 'tinhtoandidong-d59ac.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMJpoQ3MxKM4-zOxnMenp2-3oCqv_lbXU',
    appId: '1:264286272522:android:75142973980570f742f3f3',
    messagingSenderId: '264286272522',
    projectId: 'tinhtoandidong-d59ac',
    storageBucket: 'tinhtoandidong-d59ac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpzWUWsy3yhi08l8yf1gP1Z4BCEZjY2mA',
    appId: '1:264286272522:ios:7e33b32baedb2d0e42f3f3',
    messagingSenderId: '264286272522',
    projectId: 'tinhtoandidong-d59ac',
    storageBucket: 'tinhtoandidong-d59ac.appspot.com',
    iosBundleId: 'com.example.projectCuoiKi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpzWUWsy3yhi08l8yf1gP1Z4BCEZjY2mA',
    appId: '1:264286272522:ios:7e33b32baedb2d0e42f3f3',
    messagingSenderId: '264286272522',
    projectId: 'tinhtoandidong-d59ac',
    storageBucket: 'tinhtoandidong-d59ac.appspot.com',
    iosBundleId: 'com.example.projectCuoiKi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAlPf29itctx6XJ84ESYmIBDMwV_VKSyrM',
    appId: '1:264286272522:web:67450501577408bf42f3f3',
    messagingSenderId: '264286272522',
    projectId: 'tinhtoandidong-d59ac',
    authDomain: 'tinhtoandidong-d59ac.firebaseapp.com',
    storageBucket: 'tinhtoandidong-d59ac.appspot.com',
  );
}

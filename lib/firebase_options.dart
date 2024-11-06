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
    apiKey: 'AIzaSyBqLy0mvFBD1Kg3_S5pj46MsktAMMryB4U',
    appId: '1:593322108985:web:91b751147970c39b7505e8',
    messagingSenderId: '593322108985',
    projectId: 'fooddelivery-d4c2c',
    authDomain: 'fooddelivery-d4c2c.firebaseapp.com',
    storageBucket: 'fooddelivery-d4c2c.appspot.com',
    measurementId: 'G-HMKFBVG3TQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANH57Awm-HSThMm7HxmyrBekbuYIPey14',
    appId: '1:593322108985:android:d7941bfee387545c7505e8',
    messagingSenderId: '593322108985',
    projectId: 'fooddelivery-d4c2c',
    storageBucket: 'fooddelivery-d4c2c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPX4vxTkQRX53NOC7FjtydPOTRj0I-ewo',
    appId: '1:593322108985:ios:97991222df96fed87505e8',
    messagingSenderId: '593322108985',
    projectId: 'fooddelivery-d4c2c',
    storageBucket: 'fooddelivery-d4c2c.appspot.com',
    iosBundleId: 'com.example.foodDeliveryFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPX4vxTkQRX53NOC7FjtydPOTRj0I-ewo',
    appId: '1:593322108985:ios:0dbe6445b05cda427505e8',
    messagingSenderId: '593322108985',
    projectId: 'fooddelivery-d4c2c',
    storageBucket: 'fooddelivery-d4c2c.appspot.com',
    iosBundleId: 'com.example.foodDeliveryFirebase.RunnerTests',
  );
}

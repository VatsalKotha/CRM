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
    apiKey: 'AIzaSyCKLiutgJSWJi5eSCL_xt9r-iZSJV32MB8',
    appId: '1:381841773844:web:bbfeefb57c988b4bbe9e01',
    messagingSenderId: '381841773844',
    projectId: 'crm-project-demo',
    authDomain: 'crm-project-demo.firebaseapp.com',
    storageBucket: 'crm-project-demo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHRKFknKGmeh9YAG_D7MSqNdkmPjJ4UqY',
    appId: '1:381841773844:android:c0e7b14792bee733be9e01',
    messagingSenderId: '381841773844',
    projectId: 'crm-project-demo',
    storageBucket: 'crm-project-demo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdUnFMbi76gGeYLv4SY7lGVKkz23XpuRE',
    appId: '1:381841773844:ios:9805857d246b1ba6be9e01',
    messagingSenderId: '381841773844',
    projectId: 'crm-project-demo',
    storageBucket: 'crm-project-demo.appspot.com',
    iosClientId: '381841773844-qna8r9n4uv16adlotrg37iqror0pf63p.apps.googleusercontent.com',
    iosBundleId: 'com.example.crm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdUnFMbi76gGeYLv4SY7lGVKkz23XpuRE',
    appId: '1:381841773844:ios:9805857d246b1ba6be9e01',
    messagingSenderId: '381841773844',
    projectId: 'crm-project-demo',
    storageBucket: 'crm-project-demo.appspot.com',
    iosClientId: '381841773844-qna8r9n4uv16adlotrg37iqror0pf63p.apps.googleusercontent.com',
    iosBundleId: 'com.example.crm',
  );
}
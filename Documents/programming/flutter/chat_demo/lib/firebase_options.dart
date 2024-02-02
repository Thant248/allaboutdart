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
    apiKey: 'AIzaSyCVnX1SYF2Fwi3us7ydF67JiKNSwm5pwcA',
    appId: '1:578960323429:web:61fb71689fd0930445678c',
    messagingSenderId: '578960323429',
    projectId: 'wechat-87352',
    authDomain: 'wechat-87352.firebaseapp.com',
    storageBucket: 'wechat-87352.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcLFfl9r-LHoW4vztZ3yVkvHXzsAb2wQQ',
    appId: '1:578960323429:android:2fa5aea77bb52f8245678c',
    messagingSenderId: '578960323429',
    projectId: 'wechat-87352',
    storageBucket: 'wechat-87352.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkBdWZIR-cpf5HRozaDFazp3Jhk5OXWt4',
    appId: '1:578960323429:ios:23816b7f487afd4045678c',
    messagingSenderId: '578960323429',
    projectId: 'wechat-87352',
    storageBucket: 'wechat-87352.appspot.com',
    androidClientId: '578960323429-2l9bk6noejtvb4ms2kv8c8vdqoeqjopr.apps.googleusercontent.com',
    iosClientId: '578960323429-c9m445eb9b23cgve6uc4civt7estl7an.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkBdWZIR-cpf5HRozaDFazp3Jhk5OXWt4',
    appId: '1:578960323429:ios:ae2432e1e382192445678c',
    messagingSenderId: '578960323429',
    projectId: 'wechat-87352',
    storageBucket: 'wechat-87352.appspot.com',
    androidClientId: '578960323429-2l9bk6noejtvb4ms2kv8c8vdqoeqjopr.apps.googleusercontent.com',
    iosClientId: '578960323429-fealfbtjcm0nodphpd566hh549hrc3a3.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatDemo.RunnerTests',
  );
}
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:pingolearn_assignment/env.dart';

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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: Env.apiKeyWeb, // Use the environment variable
    appId: '1:526960305639:web:975a8f895b158e14fd0942',
    messagingSenderId: '526960305639',
    projectId: 'pingolearn-assignment-34f1d',
    authDomain: 'pingolearn-assignment-34f1d.firebaseapp.com',
    storageBucket: 'pingolearn-assignment-34f1d.appspot.com',
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: Env.apiKeyAndroid, // Use the environment variable
    appId: '1:526960305639:android:f10d3f18dd01cb17fd0942',
    messagingSenderId: '526960305639',
    projectId: 'pingolearn-assignment-34f1d',
    storageBucket: 'pingolearn-assignment-34f1d.appspot.com',
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: Env.apiKeyIos, // Use the environment variable
    appId: '1:526960305639:ios:b431e056b25e84ddfd0942',
    messagingSenderId: '526960305639',
    projectId: 'pingolearn-assignment-34f1d',
    storageBucket: 'pingolearn-assignment-34f1d.appspot.com',
    iosBundleId: 'com.example.pingolearnAssignment',
  );
}

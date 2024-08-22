import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform,TargetPlatform;

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
   static FirebaseOptions get currentPlatform{
    switch (defaultTargetPlatform){
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
        case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
        case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
        case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
        default:
          throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.',
          );
    }
   }

   static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCeovBiO4vV1UB1o8aXLcf6ZkVA2rO8g8', 
    appId: '1:856218726716:android:8416cc934bedc4d89eee39', 
    messagingSenderId: '856218726716', 
    projectId: 'fetin-2024-3',
    );
}
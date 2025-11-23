// lib/firebase_options.dart
// Generated Firebase configuration for bookswap-918cf project

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDrm9SJOe1kuO7wxVnBqwZWB-U2hpqCork',
    appId: '1:725862715382:web:7eb72963444bdad54481d7',
    messagingSenderId: '725862715382',
    projectId: 'bookswap-918cf',
    authDomain: 'bookswap-918cf.firebaseapp.com',
    storageBucket: 'bookswap-918cf.firebasestorage.app',
    measurementId: 'G-9XL3WGJ022',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrm9SJOe1kuO7wxVnBqwZWB-U2hpqCork',
    appId: '1:725862715382:android:7eb72963444bdad54481d7',  // Same as web but :android
    messagingSenderId: '725862715382',
    projectId: 'bookswap-918cf',
    storageBucket: 'bookswap-918cf.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrm9SJOe1kuO7wxVnBqwZWB-U2hpqCork',
    appId: '1:725862715382:ios:7eb72963444bdad54481d7',  // Same as web but :ios
    messagingSenderId: '725862715382',
    projectId: 'bookswap-918cf',
    storageBucket: 'bookswap-918cf.firebasestorage.app',
    iosBundleId: 'com.example.bookswapApp',
  );
}
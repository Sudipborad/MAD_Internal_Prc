// Firebase configuration options
// Note: Replace these with your actual Firebase project credentials

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDemoKey',
    appId: '1:123456789:web:abcdef123456',
    messagingSenderId: '123456789',
    projectId: 'tradehub-marketplace',
    authDomain: 'tradehub-marketplace.firebaseapp.com',
    databaseURL: 'https://tradehub-marketplace.firebaseio.com',
    storageBucket: 'tradehub-marketplace.appspot.com',
    measurementId: 'G-ABCDEF1234',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDemoKey',
    appId: '1:123456789:android:abcdef123456',
    messagingSenderId: '123456789',
    projectId: 'tradehub-marketplace',
    databaseURL: 'https://tradehub-marketplace.firebaseio.com',
    storageBucket: 'tradehub-marketplace.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDemoKey',
    appId: '1:123456789:ios:abcdef123456',
    messagingSenderId: '123456789',
    projectId: 'tradehub-marketplace',
    databaseURL: 'https://tradehub-marketplace.firebaseio.com',
    storageBucket: 'tradehub-marketplace.appspot.com',
  );
}

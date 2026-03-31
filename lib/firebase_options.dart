// Firebase configuration options
// Note: Replace these with your actual Firebase project credentials

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCs0RV75JguEOCcrmWqIMmsHZB-eubYKuw',
    appId: '1:542406293496:web:e15ca3f92760ab9101080d',
    messagingSenderId: '542406293496',
    projectId: 'p2p-marketplace-fc99b',
    authDomain: 'p2p-marketplace-fc99b.firebaseapp.com',
    databaseURL: 'https://p2p-marketplace-fc99b.firebaseio.com',
    storageBucket: 'p2p-marketplace-fc99b.firebasestorage.app',
    measurementId: 'G-3NJR4W0FES',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgSYabCr1NtomgXsxPZSPJ9d4XAHGa_S0',
    appId: '1:542406293496:android:82d1aa7e8a0eb52901080d',
    messagingSenderId: '542406293496',
    projectId: 'p2p-marketplace-fc99b',
    databaseURL: 'https://p2p-marketplace-fc99b.firebaseio.com',
    storageBucket: 'p2p-marketplace-fc99b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCs0RV75JguEOCcrmWqIMmsHZB-eubYKuw',
    appId: '1:542406293496:ios:e15ca3f92760ab9101080d',
    messagingSenderId: '542406293496',
    projectId: 'p2p-marketplace-fc99b',
    databaseURL: 'https://p2p-marketplace-fc99b.firebaseio.com',
    storageBucket: 'p2p-marketplace-fc99b.firebasestorage.app',
  );
}

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // Mock user for demo
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  AuthProvider() {
    // Initialize auth state
  }

  Stream get authStateStream {
    // Return a stream that emits null initially (not logged in)
    return Stream.value(null);
  }

  Future<void> signUpWithEmail(String email, String password) async {
    // Mock implementation
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> signInWithEmail(String email, String password) async {
    // Mock implementation
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> signOut() async {
    // Mock implementation
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    // Mock implementation
  }
}

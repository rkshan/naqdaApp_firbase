import 'package:firebase_auth/firebase_auth.dart';

String authErrorMessage(FirebaseAuthException error) {
  return switch (error.code) {
    'email-already-in-use' => 'An account already exists for this email.',
    'invalid-email' => 'Enter a valid email address.',
    'invalid-credential' ||
    'user-not-found' ||
    'wrong-password' => 'The email or password is incorrect.',
    'weak-password' => 'Choose a stronger password (at least 6 characters).',
    'too-many-requests' => 'Too many attempts. Please try again later.',
    'network-request-failed' =>
      'A network error occurred. Check your connection and try again.',
    'operation-not-allowed' =>
      'Email and password sign-in is not enabled for this Firebase project.',
    _ => 'Authentication failed. Please try again.',
  };
}

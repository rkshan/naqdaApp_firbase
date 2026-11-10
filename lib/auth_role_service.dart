import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRoleException implements Exception {
  const AuthRoleException(this.message);

  final String message;

  @override
  String toString() => message;
}

class AuthRoleService {
  static const roles = ['NAQDA', 'Farmers', 'Buyers'];

  static CollectionReference<Map<String, dynamic>> get _users =>
      FirebaseFirestore.instance.collection('users');

  static Future<String?> getRole(User user) async {
    final snapshot = await _users.doc(user.uid).get();
    final role = snapshot.data()?['role'];
    if (role == null) return null;
    if (role is! String || !roles.contains(role)) {
      throw const AuthRoleException(
        'Your account has an invalid role. Contact an administrator.',
      );
    }
    return role;
  }

  static Future<String> resolveRole(User user, {String? requestedRole}) async {
    if (requestedRole != null && !roles.contains(requestedRole)) {
      throw const AuthRoleException('Select a valid account type.');
    }

    final userDocument = _users.doc(user.uid);
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocument);
      if (snapshot.exists) {
        final role = snapshot.data()?['role'];
        if (role is! String || !roles.contains(role)) {
          throw const AuthRoleException(
            'Your account has an invalid role. Contact an administrator.',
          );
        }
        if (requestedRole != null && role != requestedRole) {
          throw AuthRoleException(
            'This account is registered as $role. Choose that role to sign in.',
          );
        }
        return role;
      }

      if (requestedRole == null) {
        throw const AuthRoleException(
          'Choose your account type before signing in for the first time.',
        );
      }
      if (requestedRole == 'NAQDA') {
        throw const AuthRoleException(
          'NAQDA access has not been assigned to this account. Contact an administrator.',
        );
      }

      transaction.set(userDocument, {
        'role': requestedRole,
        'displayName': user.displayName ?? '',
        'email': user.email ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      });
      return requestedRole;
    });
  }

  static Future<void> createProfile({
    required User user,
    required String role,
  }) async {
    if (role != 'Farmers' && role != 'Buyers') {
      throw const AuthRoleException(
        'Only farmer and buyer accounts can be created through signup.',
      );
    }

    await _users.doc(user.uid).set({
      'role': role,
      'displayName': user.displayName ?? '',
      'email': user.email ?? '',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}

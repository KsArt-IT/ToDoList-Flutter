import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in_all_platforms/google_sign_in_all_platforms.dart';
import 'package:todo_fui/domain/entities.dart';
import 'package:todo_fui/domain/repositories.dart';

/// {@template firebase_auth_repository}
/// Repository for working with Firebase Auth.
/// {@endtemplate}
final class FirebaseAuthRepository implements AuthRepository {
  /// {@macro firebase_auth_repository}
  FirebaseAuthRepository({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<bool> checkIsSignIn() async {
    try {
      return _firebaseAuth.currentUser != null;
    } catch (e) {
      // Handle error appropriately, e.g., log it
      return false;
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      if (_firebaseAuth.currentUser == null) return null;

      return UserEntity(
        id: _firebaseAuth.currentUser!.uid,
        email: _firebaseAuth.currentUser!.email ?? '',
        name: _firebaseAuth.currentUser!.displayName ?? '',
        avatar: _firebaseAuth.currentUser!.photoURL ?? '',
      );
    } catch (e) {
      // Handle error appropriately, e.g., log it
      return null;
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Handle error appropriately, e.g., log it or throw a custom exception
      rethrow;
    }
  }

  @override
  Future<UserEntity?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) return null;

      return UserEntity(
        id: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        name: userCredential.user!.displayName ?? '',
        avatar: userCredential.user!.photoURL ?? '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
      rethrow;
    } catch (e) {
      // Handle other errors
      rethrow;
    }
  }

  @override
  Future<UserEntity?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final googleSignIn = await GoogleSignIn().signIn();
      if (googleSignIn == null) return null;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignIn.accessToken,
        idToken: googleSignIn.idToken,
      );

      // Sign in with the credential from the Google user
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      if (userCredential.user == null) return null;

      return UserEntity(
        id: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        name: userCredential.user!.displayName ?? '',
        avatar: userCredential.user!.photoURL ?? '',
      );
    } catch (e) {
      // Handle error appropriately, e.g., log it or throw a custom exception
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await _firebaseAuth.signOut();
    } catch (e) {
      // Handle error appropriately, e.g., log it or throw a custom exception
      rethrow;
    }
  }

  @override
  Future<UserEntity?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) return null;

      return UserEntity(
        id: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        name: userCredential.user!.displayName ?? '',
        avatar: userCredential.user!.photoURL ?? '',
      );
    } catch (e) {
      // Handle error appropriately, e.g., log it or throw a custom exception
      rethrow;
    }
  }
}

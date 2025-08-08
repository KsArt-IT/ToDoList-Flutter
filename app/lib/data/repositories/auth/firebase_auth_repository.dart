import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_fui/data/mappers/model_to_domain.dart';
import 'package:todo_fui/domain/entities.dart';
import 'package:todo_fui/domain/entities/result.dart';
import 'package:todo_fui/domain/repositories.dart';

/// {@template firebase_auth_repository}
/// Repository for working with Firebase Auth.
/// {@endtemplate}
final class FirebaseAuthRepository implements AuthRepository {
  /// {@macro firebase_auth_repository}
  FirebaseAuthRepository({required FirebaseAuth firebaseAuth, required GoogleSignIn googleSignIn})
    : _firebaseAuth = firebaseAuth,
      _googleSignIn = googleSignIn;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<bool> checkIsSignIn() async {
    try {
      return _firebaseAuth.currentUser != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Result<UserEntity>> getCurrentUser() async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(_firebaseAuth.currentUser!.toDomain());
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(userCredential.user!.toDomain());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Result.failure(Exception('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return Result.failure(Exception('Wrong password provided for that user.'));
      }
      return Result.failure(Exception(e.toString()));
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> signInWithGoogle() async {
    print("-----------------");
    print("signInWithGoogle");
    try {
      const List<String> scopes = <String>['https://www.googleapis.com/auth/contacts.readonly'];
      // Запустить поток авторизации Google
      await signOut();
      // Запускаем процесс входа через Google
      await _googleSignIn.initialize();
          // hostedDomain: 'pro.ksart.todoFui',
          // clientId: '813153919918-q2dr11si6mchs64qo3te1vp38s7lghas.apps.googleusercontent.com'
          // );
      final googleUser = await _googleSignIn.authenticate(scopeHint: ['email']);
      // final googleUser = await _googleSignIn.attemptLightweightAuthentication();
      print("signInWithGoogle Запустить поток авторизации Google");
      if (googleUser == null) {
        return Result.failure(Exception('Google sign in aborted'));
      }
      // Получить idToken
      print("-----------------");
      print("Получить idToken");
      // final googleUser = await _googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      print("Получить idToken: $googleAuth");
      if (googleAuth.idToken == null) {
        return Result.failure(Exception('Google sign in failed: no idToken'));
      }
      // Создать credential для Firebase только с idToken
      print("Создать credential для Firebase только с idToken");
      final authCredential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
      // Войти в Firebase
      print("Войти в Firebase");
      final userCredential = await _firebaseAuth.signInWithCredential(authCredential);
      print("Войти в Firebase: ${userCredential.user}");
      if (userCredential.user == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(userCredential.user!.toDomain());
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(userCredential.user!.toDomain());
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }
}

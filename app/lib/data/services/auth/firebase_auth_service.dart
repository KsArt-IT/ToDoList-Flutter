import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_fui/firebase_options.dart';

/// {@template firebase_auth_service}
/// Service for working with Firebase Auth.
/// {@endtemplate}
abstract final class FirebaseAuthService {
  /// {@macro firebase_auth_service}
  const FirebaseAuthService._();

  /// Flag to check if Firebase is initialized.
  static bool _isInitialized = false;

  /// Initialize Firebase Auth.
  static Future<FirebaseAuth> init() async {
    if (!_isInitialized) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
      _isInitialized = true;
    }
    return FirebaseAuth.instance;
  }
}

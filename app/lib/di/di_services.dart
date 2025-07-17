import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_fui/data/services.dart';
import 'package:todo_fui/data/services/auth/firebase_auth_service.dart';

/// {@template di_services}
/// Class for initializing and managing the services of the program.
///
/// Responsibilities:
/// - Initializing services for working with data
/// - Handling errors during service initialization
/// - Lazy initialization of services
/// {@endtemplate}
final class DiServices {
  /// {@macro di_services}
  DiServices();

  /// Сервис для работы с Firebase Auth
  late final FirebaseAuth firebaseAuth;

  /// Сервис для работы с GoogleSignIn
  late final GoogleSignIn googleSignIn;

  /// Сервис для работы с хранилищем
  late final StorageService storageService;

  Future<void> init() async {
    try {
      debugPrint('DiServices:: init FirebaseAuth');
      // Инициализировать сервис для работы с Firebase Auth и получить экземпляр FirebaseAuth
      firebaseAuth = await FirebaseAuthService.init();
    } on Object catch (error, stackTrace) {
      debugPrint('DiServices:: init FirebaseAuth error: $error');
      return;
    }
    try {
      debugPrint('DiServices:: init GoogleSignIn');
      // Получить экземпляр GoogleSignIn
      googleSignIn = GoogleSignIn.instance;
      unawaited(googleSignIn.initialize());
    } on Object catch (error, stackTrace) {
      debugPrint('DiServices:: init GoogleSignIn error: $error');
      return;
    }
    try {
      debugPrint('DiServices:: init StorageService');
      // Инициализировать сервис для работы с хранилищем и получить экземпляр GetStorageService
      storageService = await GetStorageService.init();
    } on Object catch (error, stackTrace) {
      debugPrint('DiServices:: init StorageService error: $error');
      return;
    }
  }
}

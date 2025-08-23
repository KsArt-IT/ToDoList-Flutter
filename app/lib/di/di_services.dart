import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
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
      log('FirebaseAuth:init: start', name: 'DiServices');
      // Инициализировать сервис для работы с Firebase Auth и получить экземпляр FirebaseAuth
      firebaseAuth = await FirebaseAuthService.init();
    } on Object catch (error, stackTrace) {
      log('FirebaseAuth:init: error: $error', name: 'DiServices');
      return;
    }
    try {
      log('GoogleSignIn:init: start', name: 'DiServices');
      // Получить экземпляр GoogleSignIn
      googleSignIn = GoogleSignIn.instance;
    } on Object catch (error, stackTrace) {
      log('GoogleSignIn:init: error: $error', name: 'DiServices');
      return;
    }
    try {
      log('StorageService:init: start', name: 'DiServices');
      // Инициализировать сервис для работы с хранилищем и получить экземпляр GetStorageService
      storageService = await GetStorageService.init();
    } on Object catch (error, stackTrace) {
      log('StorageService:init: error: $error', name: 'DiServices');
      return;
    }
    log('DiServices:init: success', name: 'DiServices');
  }
}

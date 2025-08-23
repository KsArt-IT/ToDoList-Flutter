import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_fui/domain/entities/user_entity.dart';
import 'package:todo_fui/presentation/pages.dart';
import 'package:todo_fui/presentation/pages/login/login_providers.dart';
import 'package:todo_fui/presentation/pages/registration/registration_providers.dart';
import 'package:todo_fui/presentation/pages/reset_password/reset_password_providers.dart';
import 'package:todo_fui/presentation/pages/splash/splash_provider.dart';

import 'app_route.dart';

/// {@template app_router}
/// Управление навигацией для приложения.
/// {@endtemplate}
abstract final class AppRouter {
  /// {@macro app_router}
  const AppRouter._();

  /// Ключ для доступа к корневому навигатору приложения
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Начальный маршрут приложения.
  static String get initialLocation => AppRoute.home.path;

  /// Начальный маршрут приложения.
  static String get loginLocation => AppRoute.login.path;

  /// Публичные маршруты, которые не требуют авторизации
  static const _publicRoutes = [
    AppRoute.splash,
    AppRoute.login,
    AppRoute.registration,
    AppRoute.resetPassword,
  ];

  /// Флаг для проверки авторизации
  static bool _isLogin = false;
  static bool _isSplash = false;

  /// Метод для перенаправления на маршрут авторизации, если пользователь не авторизован
  static Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    // Если это первый запуск, то перенаправляем на страницу Splash
    // if (state.uri.path == AppRoute.splash.path) return null;
    if (!_isSplash) {
      _isSplash = true;
      // Разморозка первого кадра (сплеш)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        log('RefreshUserInitial', name: 'SplashProviders');
        WidgetsBinding.instance.allowFirstFrame();
      });
      return AppRoute.splash.path;
    }
    // Если пользователь авторизован, то не перенаправляем
    if (state.extra != null && state.extra is UserLogged) {
      _isLogin = true;
      return null;
    }
    if (_publicRoutes.any((route) => route.path == state.uri.path)) {
      // Если маршрут публичный, то сбрасываем флаг авторизации
      _isLogin = false;
      return null;
    }
    // Если пользователь уже авторизован, то не перенаправляем
    if (_isLogin) return null;
    // Если пользователь не авторизован, то перенаправляем на страницу авторизации
    return AppRoute.login.path;
  }

  /// Метод для создания экземпляра GoRouter
  static GoRouter createRouter() {
    return GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      redirect: _redirect,
      initialLocation: WidgetsBinding.instance.platformDispatcher.defaultRouteName,
      routes: [
        GoRoute(path: '/', redirect: (context, state) => initialLocation),
        GoRoute(
          path: AppRoute.splash.path,
          name: AppRoute.splash.name,
          builder: (context, state) => const SplashProviders(),
        ),
        GoRoute(
          path: AppRoute.login.path,
          name: AppRoute.login.name,
          builder: (context, state) => const LoginProviders(child: LoginPage()),
        ),
        GoRoute(
          path: AppRoute.registration.path,
          name: AppRoute.registration.name,
          builder: (context, state) => const RegistrationProviders(child: RegistrationPage()),
        ),
        GoRoute(
          path: AppRoute.resetPassword.path,
          name: AppRoute.resetPassword.name,
          builder: (context, state) => const ResetPasswordProviders(child: ResetPasswordPage()),
        ),
        GoRoute(
          path: AppRoute.home.path,
          name: AppRoute.home.name,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRoute.edit.path,
          name: AppRoute.edit.name,
          builder: (context, state) => const EditPage(),
        ),
        GoRoute(
          path: AppRoute.profile.path,
          name: AppRoute.profile.name,
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: AppRoute.settings.path,
          name: AppRoute.settings.name,
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    );
  }
}

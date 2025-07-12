import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_fui/domain/repositories/auth/auth_repository.dart';
import 'package:todo_fui/presentation/pages.dart';

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

  /// Публичные маршруты, которые не требуют авторизации
  static const _publicRoutes = [
    AppRoute.login,
    AppRoute.registration,
    AppRoute.resetPassword,
  ];

  /// Метод для перенаправления на маршрут авторизации, если пользователь не авторизован
  static Future<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    if (_publicRoutes.any((route) => route.path == state.uri.path)) {
      return null;
    }
    final authRepository = context.read<AuthRepository>();
    final isLoggedIn = await authRepository.checkIsSignIn();
    return isLoggedIn ? null : AppRoute.login.path;
  }

  /// Метод для создания экземпляра GoRouter
  static GoRouter createRouter() {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      redirect: _redirect,
      initialLocation:
          WidgetsBinding.instance.platformDispatcher.defaultRouteName,
      routes: [
        GoRoute(
          path: AppRoute.splash.path,
          name: AppRoute.splash.name,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: AppRoute.login.path,
          name: AppRoute.login.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: AppRoute.registration.path,
          name: AppRoute.registration.name,
          builder: (context, state) => const RegistrationPage(),
        ),
        GoRoute(
          path: AppRoute.resetPassword.path,
          name: AppRoute.resetPassword.name,
          builder: (context, state) => const ResetPasswordPage(),
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

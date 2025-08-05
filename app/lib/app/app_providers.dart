import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_fui/di/di_container.dart';
import 'package:todo_fui/domain/usecases/auth_use_cases.dart';
import 'package:todo_fui/presentation/localization/localization_notifier.dart';
import 'package:todo_fui/presentation/theme/theme_notifier.dart';

/// {@template app_providers}
/// Провайдеры для приложения.
/// {@endtemplate}
final class AppProviders extends StatelessWidget {
  /// {@macro app_providers}
  const AppProviders({
    required this.diContainer,
    required this.child,
    super.key,
  });

  /// Контейнер с зависимостями
  final DiContainer diContainer;

  /// Дочерний виджет
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(
            settingsRepository: diContainer.repositories.settingsRepository,
          ),
        ), // Провайдер для темы
        ChangeNotifierProvider(
          create: (_) => LocalizationNotifier(
            settingsRepository: diContainer.repositories.settingsRepository,
          ),
        ), // Провайдер для локализации
        // Провайдер для репозитория авторизации
        Provider.value(value: diContainer.repositories.authRepository),
        Provider.value(value: diContainer.services.googleSignIn),
        // Провайдеры для usecases
        Provider.value(value: CheckIsSignInUseCase(diContainer.repositories.authRepository)),
        Provider.value(value: GetCurrentUserUseCase(diContainer.repositories.authRepository)),
        Provider.value(value: SendPasswordResetEmailUseCase(diContainer.repositories.authRepository)),
        Provider.value(value: SignInWithEmailAndPasswordUseCase(diContainer.repositories.authRepository)),
        Provider.value(value: SignUpWithEmailAndPasswordUseCase(diContainer.repositories.authRepository)),
        Provider.value(value: SignInWithGoogleUseCase(diContainer.repositories.authRepository)),
        Provider.value(value: SignOutUseCase(diContainer.repositories.authRepository)),
      ],
      child: child,
    );
  }
}

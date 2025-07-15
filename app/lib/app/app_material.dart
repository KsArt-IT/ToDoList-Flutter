import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_fui/l10n/gen/app_localizations.dart';
import 'package:todo_fui/presentation/localization/localization_context_ext.dart';
import 'package:todo_fui/presentation/theme/app_theme.dart';
import 'package:todo_fui/presentation/theme/theme_context_ext.dart';

/// {@template app_internal}
/// Внутрішній віджет додатку, що відображає основний інтерфейс
/// після успішної ініціалізації залежностей.
///
/// Налаштовує MaterialApp з роутером, темами та локалізацією.
/// {@endtemplate}
class AppMaterial extends StatelessWidget {
  /// {@macro app_internal}
  const AppMaterial({required this.router});

  /// Роутер для навігації між екранами у додатку
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      themeMode: context.theme.themeMode,
      locale: context.localization.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

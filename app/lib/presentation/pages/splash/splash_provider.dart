import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_fui/domain/repositories/auth/auth_repository.dart';
import 'package:todo_fui/domain/usecases/auth/refresh_user_use_case.dart';
import 'package:todo_fui/presentation/pages/splash/cubit/refresh_user_cubit.dart';
import 'package:todo_fui/presentation/pages/splash/splash_page.dart';
import 'package:todo_fui/presentation/router/app_router.dart';

class SplashProviders extends StatelessWidget {
  const SplashProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final repository = context.read<AuthRepository>();
            return RefreshUserCubit(refreshUserUseCase: RefreshUserUseCase(repository));
          },
        ),
      ],
      child: BlocListener<RefreshUserCubit, RefreshUserState>(
        listener: (context, state) => switch (state) {
          RefreshUserInitial() => null,
          RefreshUserSuccess(user: final user) => context.go(
            AppRouter.initialLocation,
            extra: user,
          ),
          RefreshUserFailure() => context.go(AppRouter.loginLocation),
        },
        child: const SplashPage(),
      ),
    );
  }
}

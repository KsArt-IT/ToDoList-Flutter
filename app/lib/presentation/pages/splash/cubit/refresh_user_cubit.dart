import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fui/domain/entities/user_logged.dart';
import 'package:todo_fui/domain/usecases/auth/refresh_user_use_case.dart';

part 'refresh_user_state.dart';

class RefreshUserCubit extends Cubit<RefreshUserState> {
  final RefreshUserUseCase _refreshUserUseCase;

  RefreshUserCubit({required RefreshUserUseCase refreshUserUseCase})
    : _refreshUserUseCase = refreshUserUseCase,
      super(RefreshUserInitial()) {
    _refreshUser();
  }

  Future<void> _refreshUser() async {
    log('_refreshUser start', name: 'RefreshUserCubit');
    await Future.delayed(const Duration(seconds: 2));
    final result = await _refreshUserUseCase();
    result.map(
      onSuccess: (user) => emit(RefreshUserSuccess(user)),
      onFailure: (error) => emit(RefreshUserFailure()),
    );
  }
}

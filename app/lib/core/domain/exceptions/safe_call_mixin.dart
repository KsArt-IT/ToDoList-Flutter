import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_fui/core/domain/exceptions/result.dart';
import 'package:todo_fui/core/error/app_failure.dart';

mixin SafeCallMixin {
  Future<Result<T>> safeCall<T>(AsyncValueGetter<T> invoke) async {
    try {
      return success(await invoke());
    } on FirebaseAuthException catch (e, stackTrace) {
      log('code: ${e.code}, message: ${e.message}', name: 'FirebaseAuthException');
      return failure(AuthFailure(e.toString(), stackTrace, code: e.code));
    } on FirebaseException catch (e, stackTrace) {
      log('code: ${e.code}, message: ${e.message}', name: 'FirebaseException');
      return failure(DataFailure(e.toString(), stackTrace, code: e.code));
    } on AppFailure catch (e) {
      log('${e.message}', name: 'Failure');
      return failure(e);
    } catch (e, stackTrace) {
      log(e.toString(), name: 'catch');
      return failure(GeneralFailure(e.toString(), stackTrace));
    }
  }

  Future<Result<void>> voidSafeCall(AsyncCallback invoke) async {
    try {
      await invoke();
      return success(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return failure(AuthFailure(e.toString(), stackTrace, code: e.code));
    } on FirebaseException catch (e, stackTrace) {
      return failure(DataFailure(e.toString(), stackTrace, code: e.code));
    } on AppFailure catch (e) {
      log('${e.message}', name: 'Failure');
      return failure(e);
    } catch (e, stackTrace) {
      log(e.toString(), name: 'catch');
      return failure(GeneralFailure(e.toString(), stackTrace));
    }
  }
}

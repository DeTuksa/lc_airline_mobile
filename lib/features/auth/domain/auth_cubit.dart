import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lc_airline/core/exceptions/api_error.dart';
import 'package:lc_airline/features/auth/domain/repository/auth_repository.dart';
import 'package:lc_airline/features/auth/infrastructure/model/user_body.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository repository = AuthRepository();

  String? errorMessage;

  Future<bool> login({required UserBody payload}) async {
    try {
      emit(AuthLoading());
      final response = await repository.login(payload: payload);
      if (response is ApiError) {
        errorMessage = response.errorDescription;
        emit(AuthError(response.errorDescription ?? "Login failed"));
        return false;
      } else {
        emit(AuthSuccessful(response));
        return true;
      }
    } catch (e, s) {
      debugPrint("$e");
      debugPrintStack(stackTrace: s);
      emit(AuthError(e));
      return false;
    }
  }
}

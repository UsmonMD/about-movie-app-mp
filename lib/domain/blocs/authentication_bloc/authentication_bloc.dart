import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/api/auth/auth_repository.dart';
import 'package:movies_app/domain/models/make_login.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthEvent, AuthState> {
  AuthenticationBloc() : super(AuthInitial()) {
    on<LoginPageEvent>(
      (event, emit) async {
        emit(LoadingState());

        try {
          final MakeLogin makeLogin = await AuthRepository.getAuthLoginUser(
            event.username,
            event.password,
          );

          if (makeLogin.success == true) {
            emit(SuccessState());
          } else if (makeLogin.success == false) {
            emit(FailureState());
          }
        } catch (e) {
          emit(FailureState());
        }
      },
    );
  }
}

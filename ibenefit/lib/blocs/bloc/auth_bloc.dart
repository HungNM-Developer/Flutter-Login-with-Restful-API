import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ibenefit/model/user.dart';
import 'package:ibenefit/service/auth/auth_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService = AuthService();
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogin>((event, emit) => _handleAuthLoginEvent(event, emit));

    on<AuthLogout>((event, emit) => _handleAuthLogoutEvent(event, emit));
  }

  _handleAuthLoginEvent(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoginLoading());
    var responeData = await authService.Login({
      "email": event.email,
      "password": event.password,
    });
    if (responeData["success"]) {
      var data = responeData["data"];
      emit(AuthLoginSuccess(User.fromJson(data["user"])));
    } else {
      emit(AuthLoginError(responeData["msg"]));
    }
  }

  _handleAuthLogoutEvent(AuthLogout event, Emitter<AuthState> emit) async {
    var responseData = await authService.Logout();
    if (responseData["success"]) {
      emit(AuthLogoutSuccess(responseData["msg"]));
    } else {
      emit(AuthLogoutError(responseData["msg"]));
    }
  }
}

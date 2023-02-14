import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:desa_getasan_app/models/user.dart';
import 'package:desa_getasan_app/services/user_service.dart';
import 'package:equatable/equatable.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {

  final UserService _userService;

  ChangePasswordBloc(this._userService) : super(ChangePasswordInitial()) {
    
    on<ChangePassword>((event, emit) async {

      final result = await _userService.changePassword({
        'password': event.password,
        'new_password': event.newPassword,
        'confirm_password': event.confirmPassword
      }, event.id);

      log(result.toString());

      if(result['status'] == 'success'){
        User user = User.fromJson(result['data']);
        emit(ChangePasswordSuccess(user));
      } else{
        emit(ChangePasswordFailed(result['message'].toString()));
      }

      emit(ChangePasswordInitial());

    });

  }
}

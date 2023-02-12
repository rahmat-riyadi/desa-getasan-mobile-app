import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:desa_getasan_app/models/user.dart';
import 'package:desa_getasan_app/services/authentication_service.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final AuthenticationService _authenticationService;

  AuthenticationBloc(this._authenticationService) : super(AuthenticationInitial()) {

    on<LoginEvent>((event, emit) async {

      emit(LoadingAuthenticationState());

      SharedPreferences pref = await SharedPreferences.getInstance();
      final result = await _authenticationService.login({
        "nik": event.nik, "password" : event.password
      });

      if(result['status'] == 'success'){
        pref.setString('userData',jsonEncode(result['data']));
        User user = User.fromJson(result['data']);
        emit(AuthenticationSuccess(user));
      } else {
        emit(AuthenticationFailed({
          'code': result['code'],
          'status': result['status'],
          'message': result['message'],
        }));
      }

      if(pref.containsKey('userData')){
        String? user = pref.getString('userData');
        
        dynamic userData = jsonDecode(user!);

        log(userData['NAMA_LENGKAP'].toString());

      }



    });

  }
}

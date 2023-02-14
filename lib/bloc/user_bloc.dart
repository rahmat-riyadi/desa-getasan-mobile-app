import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:desa_getasan_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(UserInitial()) {
    
    on<EmitUserDataEvent>((event, emit) {
      log('user data : ${event.user}');
      emit(UserLoaded(event.user));
      return;
    });

    on<CheckUserDataEvent>((event, emit) async {

      final SharedPreferences pref = await SharedPreferences.getInstance();

      emit(UserLoading());

      if(pref.containsKey('userData')){

        log('user data exist');

        String? userData = pref.getString('userData');
        dynamic userDataMap = jsonDecode(userData!);        
        User user = User.fromJson(userDataMap);

        emit(UserLoaded(user));
        return;
      }

      log('user data not exist');

      emit(UserInitial());
      return;

    });

    // on<LogoutUserEvent>((event, emit) async {

    //   final SharedPreferences pref = await SharedPreferences.getInstance();
    //   pref.remove('userData');
    //   emit(UserInitial());

    // });

  }
}

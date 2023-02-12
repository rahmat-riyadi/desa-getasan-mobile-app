import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:desa_getasan_app/models/user.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    
    on<EmitUserDataEvent>((event, emit) {
      log('user data : ${event.user}');
      emit(UserLoaded(event.user));
    });

  }
}

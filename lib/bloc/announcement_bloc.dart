import 'package:bloc/bloc.dart';
import 'package:desa_getasan_app/models/announcement.dart';
import 'package:desa_getasan_app/services/announcement_service.dart';
import 'package:equatable/equatable.dart';

part 'announcement_event.dart';
part 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {

  final AnnouncementService _announcementService;

  AnnouncementBloc(this._announcementService) : super(AnnouncementInitial()) {

    on<LoadAnnouncementEvent>((event, emit) async {

      emit( AnnouncementLoading());
      final result = await _announcementService.getAnnouncementList();
      emit( AnnouncementLoaded(result));

    });

  }
}

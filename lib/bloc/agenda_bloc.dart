import 'package:bloc/bloc.dart';
import 'package:desa_getasan_app/models/agenda.dart';
import 'package:desa_getasan_app/services/agenda_service.dart';
import 'package:equatable/equatable.dart';

part 'agenda_event.dart';
part 'agenda_state.dart';

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {

  final AgendaService _agendaService;

  AgendaBloc(this._agendaService) : super(AgendaInitial()) {
    
    on<LoadAgendaEvent>((event, emit) async {

      final result = await _agendaService.getLatestAgenda();

      if(result['status'] != 'success'){
        emit(AgendaFailed());
        return;
      } 

      List<Agenda> agendas = List<Agenda>.from(result['data'].map((e) => Agenda.fromJson(e)));

      emit(AgendaLoaded(agendas));
      
    });

  }
}

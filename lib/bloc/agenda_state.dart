part of 'agenda_bloc.dart';

abstract class AgendaState extends Equatable {
  const AgendaState();
  
  @override
  List<Object> props() => [];
}

class AgendaInitial extends AgendaState {}

class AgendaFailed extends AgendaState {}

class AgendaLoaded extends AgendaState {
  
  final List<Agenda> agendas;

  const AgendaLoaded(this.agendas);

  @override
  List<Object> props() => [agendas];

}
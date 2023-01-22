part of 'announcement_bloc.dart';

abstract class AnnouncementEvent extends Equatable {
  const AnnouncementEvent();

  @override
  List<Object> props() => [];

}

class LoadingAnnouncementEvent extends AnnouncementEvent{}

class LoadAnnouncementEvent extends AnnouncementEvent {}
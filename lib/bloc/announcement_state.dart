part of 'announcement_bloc.dart';

abstract class AnnouncementState extends Equatable {
  const AnnouncementState();
  
  @override
  List<Object> props() => [];
}

class AnnouncementInitial extends AnnouncementState {}
class AnnouncementLoading extends AnnouncementState {}

class AnnouncementLoaded extends AnnouncementState {
  
  final List<Announcement> announcements;

  const AnnouncementLoaded(this.announcements);

  @override
  List<Object> props() => [announcements];

}

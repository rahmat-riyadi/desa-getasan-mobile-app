part of 'complaint_bloc.dart';

abstract class ComplaintEvent extends Equatable {
  const ComplaintEvent();

  @override
  List<Object> props() => [];
}

class SendComplaintEvent extends ComplaintEvent {

  final Complaint complaint;

  const SendComplaintEvent(this.complaint);

  @override
  List<Object> props() => [complaint];

}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:desa_getasan_app/models/complaint.dart';
import 'package:desa_getasan_app/services/complaint_service.dart';
import 'package:equatable/equatable.dart';

part 'complaint_event.dart';
part 'complaint_state.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {

  final ComplaintService _complaintService;

  ComplaintBloc(this._complaintService) : super(ComplaintInitial()) {
    
    on<SendComplaintEvent>((event, emit) async {

      Map<String, dynamic> complaintData = event.complaint.toJson();

      final result = await _complaintService.storeComplaint(complaintData);

      log(result.toString());

      if(result['status'] == 'success') {
        emit(ComplaintSended());
      } else {
        emit(ComplaintFailed());
      }

    });

  }
}

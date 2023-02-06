import 'package:bloc/bloc.dart';
import 'package:desa_getasan_app/models/umkm_data.dart';
import 'package:desa_getasan_app/services/umkm_service.dart';
import 'package:equatable/equatable.dart';

part 'umkm_event.dart';
part 'umkm_state.dart';

class UmkmBloc extends Bloc<UmkmEvent, UmkmState> {

  final UmkmService _umkmService;

  UmkmBloc(this._umkmService) : super(UmkmLoading()) {

    on<LoadUmkmEvent>((event, emit) async {

      emit(UmkmLoading());

      final dynamic result;

      if(event.id == 0){
        result = await _umkmService.getUmkm();
      } else {
        result = await _umkmService.getUmkm();
      }

      if(result['status'] == 'success'){

        UmkmData umkmData = UmkmData.fromJson(result['data']);
        emit( UmkmLoaded(umkmData));

      } else {
        emit(UmkmFailed());
      }

    });

  }
}

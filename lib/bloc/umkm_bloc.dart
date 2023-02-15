import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:desa_getasan_app/models/umkm_data.dart';
import 'package:desa_getasan_app/models/user_business_item.dart';
import 'package:desa_getasan_app/services/umkm_service.dart';
import 'package:equatable/equatable.dart';

part 'umkm_event.dart';
part 'umkm_state.dart';

class UmkmBloc extends Bloc<UmkmEvent, UmkmState> {

  final UmkmService _umkmService;

  UmkmBloc(this._umkmService) : super(UmkmInitial()) {

    on<LoadUmkmEvent>((event, emit) async {

      final dynamic result;

      if(state is UmkmInitial){

        if(event.id == 0){
          result = await _umkmService.getUmkm();
        } else {
          result = await _umkmService.getUmkmByCategory(event.id);
        }

        UmkmData umkmData = UmkmData.fromJson(result['data']);

        if(result['status'] == 'success'){
          emit(UmkmLoaded(userBusinessItem: umkmData.result, totalResults: umkmData.totalResult));
          return;
        }

        emit(UmkmFailed()); 
        return;

      }

      if(event.changeCategory){
        emit(UmkmInitial());
        result = await _umkmService.getUmkmByCategory(event.id);
        UmkmData umkmData = UmkmData.fromJson(result['data']);
        emit(UmkmLoaded(
          userBusinessItem: umkmData.result, 
          totalResults: umkmData.totalResult, 
          hasReachedMax: umkmData.result.length <= umkmData.totalResult,
          categoryId: event.id
        ));
        return;
      } 

      UmkmLoaded umkmState = state as UmkmLoaded;

      if(umkmState.totalResults == umkmState.userBusinessItem.length){
        emit(umkmState.copyWith(hasReachedMax: true));
        return;
      }

      if(event.id == 0){
        result = await _umkmService.getUmkmByCategory(event.id, page: umkmState.currPage + 1);
      } else {
        result = await _umkmService.getUmkm(page: umkmState.currPage + 1);
      }

      UmkmData umkmData = UmkmData.fromJson(result['data']);

      if(result['status'] == 'success'){
        emit( 
          umkmData.result.isEmpty
          ?
          umkmState.copyWith(hasReachedMax: true)  
          :
          umkmState.copyWith(
            userBusinessItem: umkmState.userBusinessItem + umkmData.result,
            currPage: umkmState.currPage + 1,
            categoryId: event.id,
            hasReachedMax: (umkmState.userBusinessItem + umkmData.result).length == umkmState.totalResults
          )
        );
        return;
      }

      emit(UmkmFailed()); 
      return;

    });

  }
}

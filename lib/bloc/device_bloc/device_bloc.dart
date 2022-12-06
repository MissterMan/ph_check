import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';

import '../../data/api_service.dart';
import '../../data/model.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final ApiService _apiService;
  bool isAutoReload = false;
  DeviceBloc(this._apiService) : super(DeviceEmpty()) {
    Device? _device = null;
    on<FetchDataDevice>((event, emit) async {
      try {
        emit(DeviceLoading());
        final deviceState = await _apiService.getDeviceState();
        final voltage = await _apiService.getDeviceVoltage();
        final waterStatus = await _apiService.getWaterStatus();
        final ph = await _apiService.getPh();
        _device = Device(deviceState, voltage, waterStatus, ph);
        emit(DeviceHasData(_device!));
      }catch(e){
       emit(DeviceError(e.toString()));
      }
    }

      );
    on<ToggleAutoReload>((event, emit) async {
      isAutoReload = event.isAutoReload;
      emit(DeviceLoading());
      if(_device != null){
        emit(DeviceHasData(_device!));
      }

    });
  }
}
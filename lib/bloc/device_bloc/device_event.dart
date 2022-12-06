part of 'device_bloc.dart';

@immutable
abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class FetchDataDevice extends DeviceEvent {
  const FetchDataDevice();
}
class ToggleAutoReload extends DeviceEvent {
  final bool isAutoReload;
  const ToggleAutoReload({required this.isAutoReload});
}
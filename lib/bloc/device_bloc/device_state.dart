part of 'device_bloc.dart';

@immutable
abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object> get props => [];
}

class DeviceEmpty extends DeviceState {}

class DeviceLoading extends DeviceState {}

class DeviceHasData extends DeviceState {
  final Device result;

  const DeviceHasData(this.result);

  @override
  List<Object> get props => [result];
}

class DeviceError extends DeviceState {
  final String message;

  const DeviceError(this.message);

  @override
  List<Object> get props => [message];
}


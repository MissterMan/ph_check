import 'package:flutter/cupertino.dart';
import 'package:ph_check/data/api_service.dart';
import 'package:ph_check/data/model.dart';

enum ResultState { loading, success, error }

class DeviceProvider extends ChangeNotifier {
  final ApiService apiService;

  DeviceProvider({required this.apiService}) {
    _fetchDeviceData();
  }

  late ResultState _state;
  late Device _device;
  String _message = '';

  ResultState get state => _state;
  Device get device => _device;
  String get message => _message;

  Future<dynamic> _fetchDeviceData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final deviceState = await apiService.getDeviceState();
      final voltage = await apiService.getDeviceVoltage();
      final waterStatus = await apiService.getWaterStatus();
      final ph = await apiService.getPh();

      _state = ResultState.success;
      notifyListeners();
      return _device = Device(deviceState, voltage, waterStatus, ph);
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}

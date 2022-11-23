import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://blynk.cloud/external/api/';
  static const String _token = 'v01BsO05Vn2W524ONK9apeHWN_8vDTIT';
  static const String _connected = 'isHardwareConnected?token=$_token';
  static const String _voltage = 'get?token=$_token&&v0';
  static const String _waterStatus = 'get?token=$_token&&v1';
  static const String _ph = 'get?token=$_token&&v2';

  Future<bool> getDeviceState() async {
    final response = await http.get(Uri.parse("$_baseUrl$_connected"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<double> getDeviceVoltage() async {
    final response = await http.get(Uri.parse("$_baseUrl$_voltage"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<String> getWaterStatus() async {
    final response = await http.get(Uri.parse("$_baseUrl$_waterStatus"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<int> getPh() async {
    final response = await http.get(Uri.parse("$_baseUrl$_ph"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class Device {
  final bool deviceState;
  final double voltage;
  final String waterStatus;
  final double ph;

  Device(
    this.deviceState,
    this.voltage,
    this.waterStatus,
    this.ph,
  );

  Device copyWith({
    bool? deviceState,
    double? voltage,
    String? waterStatus,
    double? ph,
  }) {
    return Device(
      deviceState ?? this.deviceState,
      voltage ?? this.voltage,
      waterStatus ?? this.waterStatus,
      ph ?? this.ph,
    );
  }
}

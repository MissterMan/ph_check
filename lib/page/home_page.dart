import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ph_check/data/api_service.dart';
import 'package:ph_check/provider/device_provider.dart';
import 'package:ph_check/util/style.dart';
import 'package:ph_check/widget/container_data.dart';
import 'package:ph_check/widget/container_status.dart';
import 'package:ph_check/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DeviceProvider>(
      create: (_) => DeviceProvider(apiService: ApiService()),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<DeviceProvider>(builder: (context, value, child) {
            if (value.state == ResultState.loading) {
              return Center(
                  child: LoadingAnimationWidget.inkDrop(
                color: blueLight,
                size: 50,
              ));
            } else if (value.state == ResultState.error) {
              return Center(
                child: Text(
                  value.message,
                  style: headline2TextStyle,
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const CustomAppBar(),
                      const SizedBox(
                        height: 10,
                      ),
                      ContainerStatus(
                        deviceState: value.device.deviceState,
                        voltage: value.device.voltage,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ContainerData(
                        ph: value.device.ph,
                        waterStatus: value.device.waterStatus,
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}

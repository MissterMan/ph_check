import 'package:flutter/material.dart';
import 'package:ph_check/data/api_service.dart';
import 'package:ph_check/provider/device_provider.dart';
import 'package:ph_check/widget/container_data.dart';
import 'package:ph_check/widget/container_status.dart';
import 'package:ph_check/widget/custom_appbar.dart';
import 'package:ph_check/widget/custom_container.dart';
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
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const CustomAppBar(),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<DeviceProvider>(
                    builder: (context, value, child) {
                      if (value.state == ResultState.loading) {
                        return const CircularProgressIndicator();
                      } else if (value.state == ResultState.error) {
                        return CustomContainer(
                            child: Center(
                          child: Text(value.message),
                        ));
                      } else {
                        return ContainerStatus(
                          deviceState: value.device.deviceState,
                          ph: value.device.ph,
                          voltage: value.device.voltage,
                          waterStatus: value.device.waterStatus,
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerData(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

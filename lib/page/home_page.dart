import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ph_check/util/style.dart';
import 'package:ph_check/widget/container_data.dart';
import 'package:ph_check/widget/container_status.dart';
import 'package:ph_check/widget/custom_appbar.dart';

import '../bloc/device_bloc/device_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
  Timer? timer = null;
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<DeviceBloc>(context, listen: false)
          .add(FetchDataDevice());
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.timer?.cancel();
    autoReload(context);
    return  Scaffold(
        body: SafeArea(
          child:
              BlocBuilder<DeviceBloc, DeviceState>(builder: (context, state) {
            if (state is DeviceLoading) {
              return Center(
                  child: LoadingAnimationWidget.inkDrop(
                color: blueLight,
                size: 50,
              ));
            } else if (state is DeviceError) {
              return Center(
                child: Text(
                  state.message,
                  style: headline2TextStyle,
                ),
              );
            } else if (state is DeviceHasData) {
              return DeviceContent(state: state);
            } else {
              return Container();
            }
          }),
        ),
      );
  }

  void autoReload(BuildContext context) {
    bool toogleAutoReload = context.watch<DeviceBloc>().isAutoReload;
    // print(toogleAutoReload);
    if(toogleAutoReload){
      Future.microtask(() {
        widget.timer = Timer.periodic(new Duration(seconds: 15), (timer) {
          BlocProvider.of<DeviceBloc>(context, listen: false)
              .add(FetchDataDevice());
        });
      });
    }
  }


}

class DeviceContent extends StatelessWidget {
  final DeviceHasData state;
  const DeviceContent({super.key, value, required this.state});

  @override
  Widget build(BuildContext context) {
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
              deviceState: state.result.deviceState,
              voltage: state.result.voltage,
            ),
            const SizedBox(
              height: 10,
            ),
            ContainerData(
              deviceState: state.result.deviceState,
              ph: state.result.ph,
              waterStatus: state.result.waterStatus,
            ),
          ],
        ),
      ),
    );
  }
}

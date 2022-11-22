import 'package:flutter/material.dart';
import 'package:ph_check/widget/container_data.dart';
import 'package:ph_check/widget/container_status.dart';
import 'package:ph_check/widget/custom_appbar.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                CustomAppBar(),
                SizedBox(
                  height: 10,
                ),
                ContainerStatus(status: true),
                SizedBox(
                  height: 10,
                ),
                ContainerData(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

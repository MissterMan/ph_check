import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ph_check/util/style.dart';
import 'package:ph_check/widget/custom_container.dart';

class ContainerData extends StatelessWidget {
  final bool deviceState;
  final double ph;
  final String waterStatus;
  const ContainerData({
    super.key,
    required this.ph,
    required this.waterStatus,
    required this.deviceState,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Data',
            style: headline2TextStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(
            color: blueLight,
            thickness: 2,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: deviceState
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 1000,
                        footer: Text(
                          'Ph',
                          style: normalTextStyle.copyWith(
                            fontSize: 25,
                          ),
                        ),
                        radius: 60.0,
                        lineWidth: 10.0,
                        percent: ph / 14,
                        center: Text(
                          ph.toString(),
                          style: normalTextStyle.copyWith(
                            fontSize: 45,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        progressColor: blueDark,
                        backgroundColor: blueLight,
                      ),
                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 1000,
                        footer: Text(
                          'Level',
                          style: normalTextStyle.copyWith(
                            fontSize: 25,
                          ),
                        ),
                        radius: 60.0,
                        lineWidth: 10.0,
                        percent: 1,
                        center: Text(
                          waterStatus,
                          style: normalTextStyle.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        progressColor:
                            waterStatus == "Normal" ? greenLight : redLight,
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/off.gif'),
                            ),
                          ),
                        ),
                        Text(
                          'Hidupkan perangkat untuk mendapatkan data',
                          style: normalTextStyle,
                        )
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

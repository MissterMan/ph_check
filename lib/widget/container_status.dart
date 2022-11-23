import 'package:flutter/cupertino.dart';
import 'package:ph_check/util/style.dart';
import 'package:ph_check/widget/custom_container.dart';
import 'package:ph_check/widget/custom_text_button.dart';

class ContainerStatus extends StatelessWidget {
  final bool deviceState;
  final double voltage;
  final String waterStatus;
  final int ph;
  const ContainerStatus({
    super.key,
    required this.deviceState,
    required this.voltage,
    required this.waterStatus,
    required this.ph,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Perangkat #1',
                style: headline2TextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Status : ${deviceState ? 'Hidup' : 'Mati'}',
                style: normalTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Voltage : ${deviceState ? voltage.toString() : '-'}',
                style: normalTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextButton(
                title: deviceState ? 'Matikan Perangkat' : 'Hidupkan Perangkat',
                padding: const EdgeInsets.symmetric(horizontal: 8),
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      deviceState ? 'assets/on.gif' : 'assets/sleep.gif'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

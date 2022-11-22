import 'package:flutter/cupertino.dart';
import 'package:ph_check/util/style.dart';
import 'package:ph_check/widget/custom_container.dart';
import 'package:ph_check/widget/custom_text_button.dart';

class ContainerStatus extends StatefulWidget {
  const ContainerStatus({super.key});

  @override
  State<ContainerStatus> createState() => _ContainerStatusState();
}

class _ContainerStatusState extends State<ContainerStatus> {
  bool status = false;

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
                'Status : ${status ? 'Hidup' : 'Mati'}',
                style: normalTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              CustomTextButton(
                title: status ? 'Matikan Perangkat' : 'Hidupkan Perangkat',
                padding: const EdgeInsets.symmetric(horizontal: 8),
                onPressed: () {
                  setState(() {
                    status = !status;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage(status ? 'assets/on.gif' : 'assets/sleep.gif'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

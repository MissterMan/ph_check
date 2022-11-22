import 'package:flutter/material.dart';
import 'package:ph_check/util/style.dart';
import 'package:ph_check/widget/chart.dart';
import 'package:ph_check/widget/custom_container.dart';
import 'package:ph_check/widget/custom_text_button.dart';
import 'package:ph_check/widget/detail_data.dart';

class ContainerData extends StatefulWidget {
  const ContainerData({super.key});

  @override
  State<ContainerData> createState() => _ContainerDataState();
}

class _ContainerDataState extends State<ContainerData> {
  String dataType = 'month';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                child: CustomTextButton(
                  onPressed: () {
                    setState(() {
                      dataType = 'week';
                    });
                  },
                  title: 'Minggu',
                  padding: const EdgeInsets.all(0),
                ),
              ),
              SizedBox(
                width: 150,
                child: CustomTextButton(
                  onPressed: () {
                    setState(() {
                      dataType = 'month';
                    });
                  },
                  title: 'Bulan',
                  padding: const EdgeInsets.all(0),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Chart(
            dataType: dataType,
          ),
          const SizedBox(
            height: 10,
          ),
          const DetailData(
            average: '7',
            max: '7',
            min: '7',
            status: 'Aman',
          ),
        ],
      ),
    );
  }
}

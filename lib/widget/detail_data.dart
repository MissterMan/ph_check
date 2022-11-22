import 'package:flutter/cupertino.dart';
import 'package:ph_check/util/style.dart';

class DetailData extends StatelessWidget {
  final String average;
  final String max;
  final String min;
  final String status;
  const DetailData({
    super.key,
    required this.average,
    required this.max,
    required this.min,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rata - rata',
                style: normalTextStyle,
              ),
              Text(
                average,
                style: normalTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ph terendah',
                style: normalTextStyle,
              ),
              Text(
                max,
                style: normalTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ph Tertinggi',
                style: normalTextStyle,
              ),
              Text(
                min,
                style: normalTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status',
                style: normalTextStyle,
              ),
              Container(
                decoration: BoxDecoration(
                  color: greenLight,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: Text(
                  status,
                  style: normalTextStyle,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

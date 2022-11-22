import 'package:flutter/cupertino.dart';
import 'package:ph_check/util/style.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: blueShadow,
            blurRadius: 4.0,
            offset: Offset(0, 2.0),
            spreadRadius: 3,
          ),
        ],
      ),
      child: child,
    );
  }
}

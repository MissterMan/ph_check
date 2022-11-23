import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ph_check/page/home_page.dart';
import 'package:ph_check/util/style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: blueDark,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'PhChecker',
                style: headline1TextStyle,
              ),
            ],
          ),
          IconButton(
            color: blueDark,
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomePage.routeName, (route) => false);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

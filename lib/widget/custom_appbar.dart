import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ph_check/util/style.dart';
import 'package:popover/popover.dart';


import '../bloc/device_bloc/device_bloc.dart';

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
              showPopover(
                context: context,
                bodyBuilder: (context) => const ListItems(),
                onPop: () => print('Popover was popped!'),
                direction: PopoverDirection.bottom,
                arrowDxOffset: 150,
                width: 200,
                height: 150,
                arrowHeight: 15,
                arrowWidth: 30,

              );
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: greenLight,
                      content: Text(
                        '🕑 Auto Reload Active Every 15 Seconds.',
                        style: normalTextStyle,
                      )),
                );

                BlocProvider.of<DeviceBloc>(context, listen: false)
                    .add(ToggleAutoReload(isAutoReload: true));

              },
              child: Container(
                height: 50,
                color: Colors.blue[100],
                child:  Center(child: Text('On Auto Reload', style: normalTextStyle,)),
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: redLight,
                      content: Text(
                        'Off Auto Reload',
                        style: normalTextStyle,
                      )),
                );
                BlocProvider.of<DeviceBloc>(context, listen: false)
                    .add(ToggleAutoReload(isAutoReload: false));
              }, child: Container(
                height: 50,
                color: Colors.blue[200],
                child:  Center(child: Text('Off',style: normalTextStyle,)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

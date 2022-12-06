import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ph_check/page/home_page.dart';
import 'package:ph_check/page/splash_page.dart';
import 'package:provider/provider.dart';

import 'bloc/device_bloc/device_bloc.dart';
import 'data/api_service.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => DeviceBloc(ApiService()),
        )
      ],
      child: MaterialApp(
        title: 'Ph Checker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (context) => const SplashPage(),
          HomePage.routeName: (context) => HomePage(),
        },
      ),
    );
  }
}

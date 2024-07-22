import 'package:flutter/material.dart';
import 'package:worldclock/pages/home.dart';
import 'package:worldclock/pages/loading.dart';
import 'package:worldclock/pages/select_location.dart';
import 'package:worldclock/pages/alarm.dart';

void main() {
  runApp(MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: {

    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/select_location': (context) => const ChooseLocation(),
    '/alarm': (context) => const Alarm(),
  }));
}

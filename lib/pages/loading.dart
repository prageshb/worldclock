import 'package:flutter/material.dart';
import 'package:worldclock/data/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //function to create and initialize WorldTime object
  void setWorldTime() async {
    WorldTime wt = WorldTime('Nepal', 'nepal.png', "Asia/Kathmandu");
    await wt.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDay': wt.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "LOADING..",
            style: TextStyle(
                color: Colors.black, fontSize: 50, fontWeight: FontWeight.w900),
          ),
        ])
      ],
    ));
  }
}

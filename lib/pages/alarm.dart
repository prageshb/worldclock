import 'package:flutter/material.dart';
import 'package:worldclock/data/slideroute.dart';
import 'home.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Alarm",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Height of the white line
          child: Divider(
            color: Colors.white, // Color of the white line
            height: 4.0, // Thickness of the white line
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'COMING SOON!',
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
            const Divider(
              height: 0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(children: [
                      IconButton(
                        iconSize: 50,
                        onPressed: () {},
                        icon: const Icon(Icons.access_alarm_rounded),
                        color: Colors.white,
                      ),
                      const Text(
                        'Alarm',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ]),
                    Column(children: [
                      //REMOVE THIS ON HOME/CLOCK

                      IconButton(
                        iconSize: 50,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            SlideLeftRoute(page: Home()),
                          );
                        },
                        icon: const Icon(Icons.access_time_filled_rounded),
                        color: Colors.white,
                      ),
                      const Text(
                        'Clock',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ]),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

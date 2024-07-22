import 'package:flutter/material.dart';

import 'package:worldclock/data/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime('Nepal', 'nepal.png', 'Asia/Kathmandu'),
    WorldTime('London', 'england.png', 'Europe/London'),
    WorldTime('India', 'india.png', 'Asia/Kolkata'),
    WorldTime('Korea', 'korea.png', 'Asia/Seoul'),
    WorldTime('Japan', 'japan.png', 'Asia/Tokyo'),
    WorldTime('Melbourne', 'australia.png', 'Australia/Melbourne'),
    WorldTime('Singapore', 'singapore.png', 'Asia/Singapore'),
    WorldTime('Los Angeles', 'usa.png', 'America/Los_Angeles')
  ];

  void updateLocation(index) async {
    WorldTime wt = locations[index];
    await wt.getTime();
    Navigator.pop(context, {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDay': wt.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'World Clock',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Height of the white line
          child: Divider(
            color: Colors.white, // Color of the white line
            height: 4.0, // Thickness of the white line
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          updateLocation(index);
                        },
                        title: Text(locations[index].location),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/flags/${locations[index].flag}'),
                        ),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}

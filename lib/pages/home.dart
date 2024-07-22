import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments
            as Map; //Getting argument data from loading page

    String daynightimg =
        data['isDay'] ? 'assets/images/day.png' : 'assets/images/night.png';

//!!IMPORTANT FOR ALARM!!
//Error occurs while trying to navigate from Alarm as i try to navigate without
//running the loading page so the map data which home page expects gets Nulled

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Clock',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          shadowColor: Colors.white,
          elevation: 6,

          // bottom: const PreferredSize(
          //   preferredSize: Size.fromHeight(4.0), // Height of the white line
          //   child: Divider(
          //     color: Colors.white, // Color of the white line
          //     height: 4.0, // Thickness of the white line
          //   ),
          // ),
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('$daynightimg'),
                fit: BoxFit.cover,
              ),
            ),
            //color: Colors.grey.shade900,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 150,
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () async {
                          dynamic datafromlocation = await Navigator.pushNamed(
                              context, '/select_location');
                          setState(() {
                            data = {
                              'time': datafromlocation['time'],
                              'location': datafromlocation['location'],
                              'isDay': datafromlocation['isDay'],
                              'flag': datafromlocation['flag']
                            };
                          
                          });
                        },
                       

                        icon: const Icon(Icons.room),
                        label: Text('Change Location'),
                       // color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      
                    ]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //       SizedBox(
                      //   height: 20,
                      // ),
                      Text(
                        data['location'],
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Text(
                  data['time'],
                  style: const TextStyle(fontSize: 45, color: Colors.black),
                ),
                SizedBox(
                  height: 378.285,
                ),
                Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Column(children: [
                        //   IconButton(
                        //     iconSize: 50,
                        //     onPressed: () {
                        //       Navigator.pushReplacement(
                        //         context,
                        //         SlideRightRoute(page: Alarm()),
                        //       );
                        //     },
                        //     icon: const Icon(Icons.access_alarm_rounded),
                        //     color: Colors.white,
                        //   ),
                        //   const Text(
                        //     'Alarm',
                        //     style:
                        //         TextStyle(color: Colors.white, fontSize: 20),
                        //   )
                        // ]),
                        Column(children: [
                          //REMOVE THIS ON HOME/CLOCK

                          IconButton(
                            iconSize: 50,
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/');
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
        ));
  }
}

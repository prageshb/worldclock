import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location = 'Kathmandu'; //location name for UI front
  late String time; // time in that given location
  late String flag = "nepal.png"; //url to picture of flag of location
  late String url = "Asia/Kathmandu"; //Location's time api url
  late bool isDay;

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async {
    Response response =
        await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map timedata = jsonDecode(response.body);

    String datetime = timedata['datetime'];
//.substring(1, 4);
    String utcmin = timedata['utc_offset'].substring(4, 6);
    String utchour = timedata['utc_offset'].substring(1, 3);


    DateTime now = DateTime.parse(datetime);

    now = now.add(Duration(hours: int.parse(utchour)));
    now = now.add(Duration(minutes: int.parse(utcmin)));



    isDay = now.hour > 6 && now.hour < 19 ? true : false;
    time = DateFormat.jm()
        .format(now); //Date format with intl in international pormat

//Time into time string of the class
    // time = now.toString();
  }
}

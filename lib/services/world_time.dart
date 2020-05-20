import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;//location for the world time
  String url; // url of the api for the world time api
  String time;//the time in that location
  String flag;//flag of the country it is in.
  bool isDaytime;

  //constructor for the class
  WorldTime({this.location,this.url,this.flag});

  Future<void> getTime() async {
    try { //get data from the world time api
      Response response = await get(
          'https://worldtimeapi.org/api/timezone/$url');
      //print(response.body);
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      int hr = int.parse(offset.substring(1, 3));
      //print(hr);
      int m = int.parse(offset.substring(4, 6));
      //print(m);
      //print(datetime);
      //print(offset );

      //parsing datetime
      DateTime dateTime1 = DateTime.parse(datetime);
      //print(dateTime1);

      //adding time to utc datetime
      dateTime1 = dateTime1.add(Duration(hours: hr, minutes: m));
      //print(dateTime1);
      isDaytime = dateTime1.hour > 6 && dateTime1.hour<19 ? true : false ;
      time = DateFormat.jm().format(dateTime1);
    }
    catch (e) {
      print('CAUGHT THE ERROR');
      time = 'could not get time data';
    }
  }
}


import 'package:flutter/material.dart';
import 'package:worldmap/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  //list of locations and data for choosing locations.

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
    void updateTime(index) async{
      WorldTime instance = locations[index];
      await instance.getTime();
      //navigate to home screen
      Navigator.pop(context,{
        'location' : instance.location,
        'flag' : instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      });

    }
  /*void getData() async {
    //we insert asynchronus code here which is used when working with an api
    //we are gonna simulate a network request of fetching data here
    //what the await keyword does is that it will not run the next function in the async func
    //so that the functions depend on each other.
    String username = await Future.delayed(Duration(seconds: 3), () {
      return ('yoshi');
    });


    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'vegan and guitarist';
    }
    );

    print('$username- $bio');
  }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // this print statement will print before the getData function's print statement
    //because the voidData function is async.
    print('statement');
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Text('Choose location screen'),
      appBar: AppBar(
        title: Text('Choose a location'),
        backgroundColor: Colors.indigo[500],
      ),
      body: ListView.builder(
          itemCount: locations.length ,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0) ,
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                    },
                  title: Text(locations[index].location) ,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );

          }),
    );
  }
}

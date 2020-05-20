import 'package:flutter/material.dart';
import 'package:worldmap/pages/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /*void getData() async {
      //this get function of Http package helps us to work th APIs
    Response response =await get('https://jsonplaceholder.typicode.com/todos/1');
      //Response datatype is given by Http, it returns a string which we need to decode or
      // convert into a map data. we use jsonDecode fo that and import the conert package.

    Map data = jsonDecode(response.body);
    print(data);


  }*/
  //String time = 'loading';

  void setupworldtime() async {
    WorldTime time1 = WorldTime(
        location: 'Kolkata', flag: 'germany.png', url: 'Asia/Kolkata');
    await time1.getTime();
    //print(time1.time )
    Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location' : time1.location,
    'flag' : time1.flag,
      'time': time1.time,
      
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupworldtime();


    //getTime();
    //getData();
    // this print statement will print before the getData function's print statement
    //because the voidData function is async.
   // print('statement');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60.0),
        child: Text("Loading screen"),
        
      )

    );
  }
}

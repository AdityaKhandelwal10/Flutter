import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {
    //extract the arguments from the current ModalRoute settings and cast them as
    data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;

    print('$data');
  //set background from here by evaluating the isDaytime boolean
    String bgImage = data['isDaytime'] ? 'daytime.jpg' : 'nighttime.jpg';

    //selecting the background colors for scaffold
    Color bgScaff = data['isDaytime'] ?  Colors.lightGreen[800] : Colors.black;

    return Scaffold(
      backgroundColor: bgScaff,
      body: SafeArea(
        //using a conatiner here required for BoxDecoration
          child:Container(
            //BoxDecoration widget helps to fit the image to the screen
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )

            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async{
                     dynamic result1 =  await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {

                         data['time' ]= result1['time'],
                         data['location'] = result1['location'],
                         data['isDaytime'] = result1['isDaytime'],
                         data['flag'] =result1['flag']

                       }as Map  ;
                     });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                        'Choose Location',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),


                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing:2.0,
                          color: Colors.white,

                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0 ,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  )

                ],
              ),
            ),
          )
      ),
    );
  }
}

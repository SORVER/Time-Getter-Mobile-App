import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

   void setWorldTime  () async {
     
         WorldTime instan = WorldTime(location : 'Berlin' , flag: 'germany.png' , url : 'Europe/Berlin' );
         await instan.getTime();
         print(instan.time);
         Navigator.pushReplacementNamed(context, '/home', arguments: {
              
              'location' : '${instan.location}',
              'flag' : '${instan.flag}',
              'time' : '${instan.time}',
              'isDayTime' : '${instan.isDayTime}'


         });
 
   }

  @override 
  void initState(){
    
    super.initState();
    setWorldTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blue[900],
      
        body: Center(
        child : const SpinKitRotatingCircle(
         color: Colors.white,
        size: 50.0,
        ),

       )

    );
  }
}
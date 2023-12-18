import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {

  @override
  _Home_s createState() => _Home_s();
}

class _Home_s extends State<Home> {

  Map  data = {

  };

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map ;
    print(data);

   if(data.isNotEmpty){
          Fluttertoast.showToast(
        msg: "New Country",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

   }


    String backgroundImage = data['isDayTime'] == 'true' ? 'day.jpg' : 'night.jpg';
    Color ourColor = data['isDayTime'] == 'true' ? Colors.blue : Colors.blueGrey ;
    return Scaffold(
        
        backgroundColor: ourColor,
        body: SafeArea( 
          child : Container(
             decoration: BoxDecoration(
                    image: DecorationImage(
                      
                      image: AssetImage ('assets/$backgroundImage')
                    )

             ),
          child : Padding (
            padding: EdgeInsets.fromLTRB(0.0, 117.0, 0.0, 0.0),
          child: Column(
            
            children: <Widget>[
                 
                 TextButton.icon(
                  
                  onPressed : () async {

                    dynamic result =  await Navigator.pushNamed(context,'/location');

                    setState(() {
                        data = {
                           'time' : result['time'],
                           'location': result['location'],
                           'isDayTime': result['isDayTime'],
                           'flag' : result['flag'],
                        };
                    });
                    


                    
                  },
                  icon : Icon(Icons.edit_location , color : Colors.grey[800],),
                  label : Text ('edit Location', style: TextStyle( color : Colors.white,),),
                 ),

             SizedBox(height: 20.0,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget> [
               
                 Text( data['location'], style : TextStyle ( color: Colors.white, fontSize : 20.0, letterSpacing: 2.0,)),


             ],),
                              SizedBox(height : 20.0,),
                 Text(data['time'], style : TextStyle(fontSize: 60.0,color: Colors.white,)) ,

          ],
          
          ), 
          ),
          
          ),
          
          
          ),
    );
  }
}
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String ? location, time , flag , url ;
  late bool? isDayTime;
 
  WorldTime({this.location,this.flag,this.url});

   Future<void> getTime  () async {

              try {
                       final response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
       Map data = jsonDecode(response.body);
       String datetime = data['datetime'];
       String offset = data['utc_offset'].substring(1,3);
      
       DateTime tempDate = DateTime.parse(datetime);
       tempDate = tempDate.add(Duration(hours: int.parse(offset)));

       isDayTime = tempDate.hour > 6 && tempDate.hour < 20 ? true : false ;
       time  = DateFormat.jm().format(tempDate);
       

              } catch (e) {

                   print('error: $e');
                   time = 'data can not load ' ;

              }
      
  }

  

}

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String url;
  bool isDaytime = true; //dummy
  String time = "unasigned";

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response rsp =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/${url}'));
      Map data = jsonDecode(rsp.body);

      String datetime = data["utc_datetime"];
      String offset = data["utc_offset"];
      String offset_sign = offset.substring(0, 1);
      int offset_hour = int.parse(offset.substring(1, 3));
      int offset_minute = int.parse(offset.substring(4, 6));
      if (offset_sign == "-") {
        offset_hour *= -1;
        offset_minute *= -1;
      }

      DateTime dt = DateTime.parse(datetime);
      dt = dt.add(Duration(hours: offset_hour, minutes: offset_minute));

      isDaytime = (dt.hour >= 6 && dt.hour <= 18) ? true : false;
      time = DateFormat.jm().format(dt);
    } catch (e) {
      print("error caught: $e, setting time to \"error\" to prevent error");
      time = "error";
    }
  }
}

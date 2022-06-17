import 'package:flutter/material.dart';
import 'package:ninja_id/services/WorldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading...";
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Jakarta", url: "Asia/Jakarta", flag: "indonesia.png");

    await instance.getTime();
    setState(() {
      time = instance.time;
    });
    // print("hello");
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SpinKitWanderingCubes(
        color: Colors.white,
        size: 50,
      ),
    );
  }
}

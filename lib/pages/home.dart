import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String dayImg = "day.jpg";
  String nightImg = "night.jpg";
  String backgroundImg = "";

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    backgroundImg = (data['isDaytime']) ? dayImg : nightImg;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$backgroundImg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                label: Text(
                  'Choose Location',
                  style: TextStyle(color: Colors.grey[200]),
                ),
                icon: Icon(Icons.edit_location, color: Colors.grey[200]),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data['location'],
                      style: TextStyle(fontSize: 35, color: Colors.white))
                ],
              ),
              SizedBox(height: 20),
              Text(data['time'],
                  style: TextStyle(fontSize: 70, color: Colors.white))
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}

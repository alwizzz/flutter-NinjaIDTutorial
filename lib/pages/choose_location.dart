import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ninja_id/services/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locationList = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      backgroundColor: Colors.grey[350],
      body: ListView.builder(
          itemCount: locationList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1),
              child: Card(
                child: ListTile(
                  onTap: () {},
                  title: Text(locationList[index].location),
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 20,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locationList[index].flag}'),
                      radius: 19.5,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:smart_stick/drawer.dart';

import '../drawer.dart';

class DevInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Device Info",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Device Info'),
      ),
    );
  }
}


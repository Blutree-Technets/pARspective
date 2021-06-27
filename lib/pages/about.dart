import 'package:flutter/material.dart';
// import 'package:smart_stick/drawer.dart';

import '../drawer.dart';

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Contact Us",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Contact Us'),
      ),
    );
  }
}


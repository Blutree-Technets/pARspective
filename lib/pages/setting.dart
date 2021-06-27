import 'package:flutter/material.dart';

import '../drawer.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}


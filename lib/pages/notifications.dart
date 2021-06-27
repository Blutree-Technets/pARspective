import 'package:flutter/material.dart';

import '../drawer.dart';

class notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Notifications'),
      ),
    );
  }
}


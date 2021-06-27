import 'dart:async';
import 'dart:io';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


// ignore: camel_case_types
class dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  // dashboard({Key key, this.title}) : super(key: key);
  // final String title;
 
}

enum PlayerState { stopped, playing, paused }

// ignore: camel_case_types
class _dashboardState extends State<dashboard> {
 
 
  String mp3uri = '';
  String _userName;
  bool songplaying = false;
  void playSound() {
    AudioPlayer player = AudioPlayer();
    if (!songplaying) {
      player.play(mp3uri);
    } else {
      player.pause();
    }
    songplaying = !songplaying;
  }

  void _loadSound() async {
    final ByteData data = await rootBundle.load('assets/Police Siren.mp3');
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/Police Siren.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3uri = tempFile.uri.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Alarm",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                
              ),
              ListView(
              
                children: <Widget>[
                  SizedBox(height: 10.0),
           _emergency()
                ],
              ),
              //),
              //)
            ],
          ),
        ),
      ),
    );
  }

  Widget _emergency() {
    return Container(
        margin: EdgeInsets.all(15.0),
        //fromLTRB(15, 0, 15, 10),
        padding: const EdgeInsets.all(20),
        // ignore: deprecated_member_use
        child: RaisedButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.orange[500],
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Emergency',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.red[900]),
          ),
          onPressed: () {
            //fun1
            playSound(); //fun2
          },
        ));
  }
}

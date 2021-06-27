import 'dart:io';

import 'package:audioplayer/audioplayer.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_realtime_detection/obstecledetection/camerahome.dart';
import 'package:flutter_realtime_detection/Currency Detection/currencymain.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../drawer.dart';


 List<CameraDescription> cameras=[];

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}
enum PlayerState { stopped, playing, paused }
class _homeState extends State<home> {

String mp3uri = '';
bool songplaying = false;

  void _loadSound() async {
    final ByteData data = await rootBundle.load('assets/Indian Police siren.mp3');
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/Indian Police siren.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3uri = tempFile.uri.toString();
  }

  void playSound() {
    AudioPlayer player = AudioPlayer();
     print(mp3uri);
    if (!songplaying) {
     
      player.play(mp3uri);
      
    } else {
      player.pause();
    }
    songplaying = songplaying;
  }



  Future getcameras ()async {
    cameras=await availableCameras();
    print (cameras);
  }

  get child => null;

 @override
  void initState() {
    getcameras();
    _loadSound();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Home'),
        backgroundColor: Colors.amber,
      ),
      drawer:AppDrawer(),
       body: _buttons(context),  

    );
  }

  bool _showAppbar = true;

  bool isScrollingDown = true;


//class buttons extends StatelessWidget {
 
 // @override
  Widget _buttons(context) {
    return ListView(
      children: <Widget>[
        obstecledetection(context),
        voiceassistant(),
        navigation(),
        notedetector(context),
        findmystick(),
        emergencyalarm(context),
        //FlutterBlueApp(),
      ],
      
    );
  }

Widget obstecledetection(context){
  return Container(
    padding:EdgeInsets.all(10.0),
    child: Card(
      color:Colors.blue,
      elevation:10.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: InkWell(
        onTap: (){
Navigator.push(context,MaterialPageRoute(builder: (context)=> new CameraPage(cameras)));},
        splashColor:Colors.blue,
        child: Column(children: <Widget>[
          const ListTile(
            leading:Icon(Icons.mic),
            title: Text(
              'Obstecle detection',
              style: TextStyle(fontSize: 15.0,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]

        ),),
      ),
    );
}

Widget voiceassistant(){
  return Container(
    padding:EdgeInsets.all(10.0),
    child: Card(
      color:Colors.blue,
      elevation:10.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: InkWell(
        splashColor:Colors.blue,
        child: Column(children: <Widget>[
          const ListTile(
            leading:Icon(Icons.mic),
            title: Text(
              'Voice Assistant',
              style: TextStyle(fontSize: 15.0,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]

        ),),
      ),
    );
}

Widget navigation(){
  return Container(
    padding:EdgeInsets.all(10.0),
    child: Card(
      color:Colors.blue,
      elevation:10.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: InkWell(
        splashColor:Colors.blue,
        child: Column(children: <Widget>[
          const ListTile(
            leading:Icon(Icons.map),
            title: Text(
              'Navigation',
              style: TextStyle(fontSize: 15.0,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]

        ),),
      ),
    );
}

Widget notedetector(context){
  return Container(
    padding:EdgeInsets.all(10.0),
    child: Card(
      color:Colors.blue,
      elevation:10.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: InkWell(
        onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=> new TakePictureScreen(camera:cameras )));},
        splashColor:Colors.blue,
        child: Column(children: <Widget>[
          const ListTile(
            leading:Icon(Icons.camera),
            title: Text(
              'Note Detector',
              style: TextStyle(fontSize: 15.0,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]

        ),),
      ),
    );
}

Widget findmystick(){
  return Container(
    padding:EdgeInsets.all(10.0),
    child: Card(
      color:Colors.blue,
      elevation:10.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: InkWell(
        splashColor:Colors.blue,
        child: Column(children: <Widget>[
          const ListTile(
            leading:Icon(Icons.find_in_page),
            title: Text(
              'Find My Stick',
              style: TextStyle(fontSize: 15.0,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]

        ),),
      ),
    );
}

Widget emergencyalarm(context){
  return Container(
    padding:EdgeInsets.all(10.0),
    child: Card(
      color:Colors.blue,
      elevation:10.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
        ),
      ),
    ); 
 }
}




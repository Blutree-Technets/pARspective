import 'package:flutter/material.dart';
// import 'package:smart_stick/pages/home.dart';
// import 'package:smart_stick/pages/maps.dart';
// import 'package:smart_stick/pages/setting.dart';
// import 'package:smart_stick/pages/notifications.dart';
// import 'package:smart_stick/pages/devInfo.dart';
// import 'package:smart_stick/pages/about.dart';

import 'pages/about.dart';
import 'pages/devInfo.dart';
import 'pages/home.dart';
import 'pages/maps.dart';
import 'pages/setting.dart';
//import 'ble.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new home()),
                  )),
              //     _createDrawerItem(
              // icon: Icons.home,
              // text: 'BLE Sensor data',
              // onTap: () => Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => new FlutterBlueApp()),
              //     )),
          _createDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new settings()),
                  )),
          _createDrawerItem(
              icon: Icons.map,
              text: 'Maps',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new MapsPage()),
                  )),
          _createDrawerItem(
              icon: Icons.perm_device_information,
              text: 'Device Info',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new DevInfoPage()),
                  )),
          _createDrawerItem(
              icon: Icons.info_outline,
              text: 'Contact Us',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new about()),
                  )),
          Divider(
            thickness: 1.0,
            color: Colors.amber,
          ),
          new Container(
            child: ListTile(
              title: new Text(
                'Policies and Agreements',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.format_list_numbered_rtl,
                color: Colors.black,
              ),
              onTap: () {},
            ),
          ),
          Positioned(
            bottom: 200.0,
            left: 10.0,
            child: ListTile(
              title: new Text(
                'Log out',
                style: TextStyle(color: Colors.red),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new home()),
            ),
          ),
          )
        ],
      ),
    );
  }

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.zero,
      //padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/drawer_image.png'),
        ),
      ),
      accountName: Text(
        'BluTree',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      accountEmail: Text(
        'blutree.tech@gmail.com',
        style: TextStyle(fontSize: 15.0),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/logo.png'),
      ),
      onDetailsPressed: () {},
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 14.0,
              color: Colors.black),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

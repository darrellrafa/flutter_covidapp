import 'package:flutter/material.dart';
import 'package:fluttercovidapp/config/palette.dart';

import 'bottom_nav_screen.dart';

class About extends StatelessWidget {
  goBack(BuildContext context) {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Tracker',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Color(0xFAFAFA),
          )
      ),
      home: Scaffold(
        appBar: AppBar(
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.home_rounded),
          //     color: Colors.white,
          //     onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));},
          //   )
          // ],
          title: Text('About Developer', style: TextStyle(color: Colors.white)),
          backgroundColor: Palette.primaryColor,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                  color: Color(0xFF473F97),
                ),
              ),
              ListTile(
                // icon: Icons.info_outlined,
                title: Text('Home'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
                },
              ),
              ListTile(
                // icon: Icons.info_outlined,
                title: Text('About Developer'),
                // onTap: () {
                //   // Update the state of the app
                //   // ...
                //   // Then close the drawer
                //   Navigator.pop(context);
                // },
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Darrell Rafa Alamsyah',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                child: ListTile(
                    title: Text('darrell2645@gmail.com'),
                    subtitle: Text('email pribadi')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
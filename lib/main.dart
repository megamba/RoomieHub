
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/login.dart';
import 'package:flutter_projects/sign_up.dart';

import 'home_page.dart';


void main() {
  runApp(MyApp());
  //       runApp(DevicePreview(
  //       builder: (context) => MyApp(),
  //        enabled:  !kReleaseMode,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roomie Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Montserrat',
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontFamily: 'Montserrat', fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        ),

      ),
      home: MySplashPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MySplashPage extends StatefulWidget {
  MySplashPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MySplashPageState createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  late TextEditingController _controller;
  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop),
              image: AssetImage(
                  'assets/RoomieHub.png'),
              fit: BoxFit.cover,
            ),
        ),

        child: Column(
          children: [

            SizedBox(
              height: 150,
            ),

            SizedBox(
                width: 300,
                child: Text("ROOMIE",
                    style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)
                ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                ),
                Text("H",
                    style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.home_rounded,
                  size: 55,
                  color: Colors.white,
                ),
                Text("B",
                    style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),

            SizedBox(
              height: 230,
            ),

            FlatButton(
              minWidth: 300,
              height: 45,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(title: "login")));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.white)),
              child: Text("LOGIN",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),

            SizedBox(
              height: 20,
            ),

            FlatButton(
              color: Colors.white,
              minWidth: 300,
              height: 45,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(title: "signup")));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.white)),
              child: Text("SIGN UP",
                  style: TextStyle(color: Colors.teal, fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}

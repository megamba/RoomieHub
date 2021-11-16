import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_projects/home_page.dart';

class RoomiePage extends StatefulWidget {
  RoomiePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RoomiePageState createState() => _RoomiePageState();
}

class _RoomiePageState extends State<RoomiePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),

          Row(
            children: [
              SizedBox(width: 15),
              SizedBox(
                width: 50,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  iconSize: 25,
                  color: Colors.black,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: "home")));
                  },
                ),
              ),
              Text(
                'Household',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),

          SizedBox(height: 15),

          Container(
            height: 100,
            width: 350,
            decoration: new BoxDecoration(
                color: Color(0xE6ea5171),
                borderRadius: new BorderRadius.all(Radius.circular(10))
            ),
            child: new Row(
              children: [
                SizedBox(
                  width: 20,
                ),

                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/photo-1492562080023-ab3db95bfbce.jpg'),
                ),

                SizedBox(
                  width: 20,
                ),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Roomie 1',
                    style: TextStyle(fontSize:24,color: Colors.black),
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 15),

          Container(
            height: 100,
            width: 350,
            decoration: new BoxDecoration(
                color: Color(0xE6725cae),
                borderRadius: new BorderRadius.all(Radius.circular(10))
            ),
            child: new Row(
              children: [
                SizedBox(
                  width: 20,
                ),

                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/photo-1530021232320-687d8e3dba54.jpg'),
                ),

                SizedBox(
                  width: 20,
                ),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Roomie 2',
                    style: TextStyle(fontSize:24,color: Colors.black),
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 15),

          Container(
            height: 100,
            width: 350,
            decoration: new BoxDecoration(
                color: Color(0xE63275ce),
                borderRadius: new BorderRadius.all(Radius.circular(10))
            ),
            child: new Row(
              children: [
                SizedBox(
                  width: 20,
                ),

                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/photo-1628210726948-4979adb3d9d0.jpg'),
                ),

                SizedBox(
                  width: 20,
                ),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Roomie 3',
                    style: TextStyle(fontSize:24,color: Colors.black),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
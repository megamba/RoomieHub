import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/login.dart';
import 'package:flutter_projects/profile.dart';
import 'package:flutter_projects/roomies_page.dart';
//import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'checkbox_state.dart';
import 'chore_items.dart';
import 'event_calendar.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xFFea5171),
      ),

 /*     floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.checklist_rounded),
            label: 'Chore'
          ),
          SpeedDialChild(
              child: Icon(Icons.shopping_cart_rounded),
              label: 'Shopping List Item'
          ),
          SpeedDialChild(
              child: Icon(Icons.event_rounded),
              label: 'Event'
          ),
        ],
      ),*/

      body: Column(
        children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  Text(
                    'Good afternoon,\n<name>',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                  ),


                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(title: "profile")));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/Profile-Photo-Wallpaper.jpg'),
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(
                height: 20,
              ),


              Container(
                height: 45,
                width: 350,
                decoration: new BoxDecoration(
                    color: Color(0xffC9C9C9),
                    borderRadius: new BorderRadius.all(Radius.circular(10))
                ),
                child: new Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Our Home',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),

                    SizedBox(
                      width: 130,
                    ),

                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(''),
                    ),

                    SizedBox(
                      width: 8,
                    ),

                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(''),
                    ),

                    IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.add_circle_outline),
                        iconSize: 40,
                        color: Color(0xFFea5171),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RoomiePage(title: "roomies")));
                        },
                      ),
                  ],
                ),
              ),



              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upcoming Events',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  IconButton(padding: EdgeInsets.zero,
                    icon: const Icon(Icons.more_horiz_rounded),
                    iconSize: 30,
                    color: Color(0xff787878),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPage(title: "event calendar")));
                    },
                  ),
                ],
              ),

              Container(
                height: 70,
                width: 350,
                decoration: new BoxDecoration(
                    color: Color(0xffC9C9C9),
                    borderRadius: new BorderRadius.all(Radius.circular(10))
                ),
              ),

              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Chores',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  IconButton(padding: EdgeInsets.zero,
                    icon: const Icon(Icons.more_horiz_rounded),
                    iconSize: 30,
                    color: Color(0xff787878),
                    onPressed: (){

                    },
                  ),
                ],
              ),



              Container(
                height: 140,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:6,
                      //separatorBuilder: (context, _) => SizedBox(width: 1),
                      itemBuilder: (context, index) => buildCard(chore: chore[index]),

                  ),
              ),




              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Shopping List',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  /*IconButton(padding: EdgeInsets.zero,
                    icon: const Icon(Icons.more_horiz_rounded),
                    iconSize: 30,
                    color: Color(0xff787878),
                    onPressed: (){

                    },
                  ),*/
                ],
              ),


              Container(
                height: 140,
                width: 350,
                margin: EdgeInsets.only(right: 10),
                decoration: new BoxDecoration(
                    color: Color(0xffC9C9C9),
                    borderRadius: new BorderRadius.all(Radius.circular(10))
                ),

                child: ListView(
                  padding: EdgeInsets.all(12),
                  children: [
                    ...shoppingList.map(buildSingleCheckbox).toList(),
                  ],
                ),
              ),











        ],
      ),

    );
  }
  Widget buildSingleCheckbox(CheckBoxState checkbox) => CheckboxListTile(
    controlAffinity: ListTileControlAffinity.leading,
    activeColor: Color(0xFF3640b2),
    value: checkbox.value,
    onChanged: (value) => setState(() => checkbox.value = value!),
    title: Text(
      checkbox.title,
      style: TextStyle(fontSize: 16,color: Colors.black54),
    ),
  );

  Widget buildCard({required ChoreItem chore}) =>
      Container(
        height: 100,
        width: 120,
        margin: EdgeInsets.only(left: 10),
        decoration: new BoxDecoration(
            color: Color(0xffC9C9C9),
            borderRadius: new BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Transform.scale(
                  scale: 1.2,
                  child:Checkbox(
                    activeColor: Color(0xE63275ce),
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

            Icon(
              chore.icon,
              color: chore.color,
              size: 30,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            Text(
              chore.title,
              style: TextStyle(fontSize: 15, color: Colors.black54 ),
              textAlign: TextAlign.center,
            ),
            Text(
              chore.subtitle,
              style: TextStyle(fontSize: 13, color: Colors.black54  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),

      );
}







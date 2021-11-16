import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_projects/main.dart';
import 'package:flutter_projects/sign_up.dart';

import 'checkbox_state.dart';
import 'home_page.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Calendar',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

              SfCalendar(
              view: CalendarView.month,
              firstDayOfWeek: 7,
              dataSource: MeetingDataSource(getAppointments()),
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
                      'Events',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
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

                ],
              ),
            ),



          ],
        ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: '<Roomie 1> Birthday Party',
      color: Colors.blue,
      //recurrenceRule: 'FREQ=DAILY;COUNT=3',
      isAllDay: false));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Board Meeting',
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;COUNT=3',
      isAllDay: false));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

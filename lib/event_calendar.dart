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
                  'Calendar',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

              Container(
                height:500,
                child: SfCalendar(
                  backgroundColor: Color(0xffC9C9C9),
                  viewHeaderStyle: ViewHeaderStyle(backgroundColor: Colors.lightBlue),
                  view: CalendarView.month,
                  firstDayOfWeek: 7,
                  dataSource: MeetingDataSource(getAppointments()),
                  monthViewSettings: MonthViewSettings(
                    showAgenda: true,
                    numberOfWeeksInView: 6,
                  ),
                ),
              ),




/*            Row(
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
                IconButton(padding: EdgeInsets.zero,
                  icon: const Icon(Icons.add_circle_outline_rounded),
                  iconSize: 20,
                  color: Color(0xff787878),
                  onPressed: (){

                  },
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
            ),*/



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
      color: Colors.deepPurpleAccent,
      //recurrenceRule: 'FREQ=DAILY;COUNT=3',
      isAllDay: false));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Board Meeting',
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;COUNT=3',
      isAllDay: false));

  meetings.add(Appointment(
      startTime: DateTime(2021, 12, 8, 12, 0, 0),
      endTime: endTime,
      subject: 'Work',
      color: Colors.pink,
      recurrenceRule: 'FREQ=DAILY;COUNT=1',
      isAllDay: false));

  meetings.add(Appointment(
      startTime: DateTime(2021, 12, 24, 9, 0, 0),
      endTime: DateTime(2021, 12, 24, 2, 0, 0),
      subject: 'Christmas Eve',
      color: Colors.lightGreen,
      recurrenceRule: 'FREQ=DAILY;COUNT=1',
      isAllDay: false));

  meetings.add(Appointment(
      startTime: DateTime(2021, 12, 25, 9, 5, 0),
      endTime: DateTime(2021, 12, 25, 2, 0, 0),
      subject: 'Christmas Day',
      color: Colors.lightGreen,
      recurrenceRule: 'FREQ=DAILY;COUNT=1',
      isAllDay: false));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

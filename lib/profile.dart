import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/main.dart';
import 'package:flutter_projects/sign_up.dart';

import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(
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
                    'Profile',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(width: 170),
                  IconButton(
                    icon: const Icon(Icons.settings_rounded),
                    iconSize: 25,
                    color: Colors.black,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: "home")));
                    },
                  ),
                ],
              ),

              SizedBox(height: 20,),

              Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    'Name ',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Container(
                    height: 30,
                    width: 300,
                    decoration: new BoxDecoration(
                        color: Color(0xffC9C9C9),
                        borderRadius: new BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10,),

              Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    'Email ',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Container(
                    height: 30,
                    width: 300,
                    decoration: new BoxDecoration(
                        color: Color(0xffC9C9C9),
                        borderRadius: new BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    'Phone Number ',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Container(
                    height: 30,
                    width: 200,
                    decoration: new BoxDecoration(
                        color: Color(0xffC9C9C9),
                        borderRadius: new BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10,),

              Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    'Password ',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Container(
                    height: 30,
                    width: 260,
                    decoration: new BoxDecoration(
                        color: Color(0xffC9C9C9),
                        borderRadius: new BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ],
              ),



            ],
          ),
        ],
      ),
    );
  }
}
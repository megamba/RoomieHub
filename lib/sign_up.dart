import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/login.dart';

import 'main.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3A405A),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      iconSize: 25,
                      color: Colors.white,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MySplashPage(title: "splash")));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 30,
                width: 340,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign up using one of your existing accounts',
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 60,
                    child: RaisedButton(
                      child: Text('Google Logo'),
                      color: Color(0xff99B2DD),
                      onPressed: () {

                      },
                    ),
                  ),

                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    width: 150,
                    height: 60,
                    child: RaisedButton(
                      child: Text('Apple Logo'),
                      color: Color(0xff99B2DD),
                      onPressed: () {

                      },
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              Container(
                margin: EdgeInsets.only(left: 35, right: 35, top:10, bottom:10 ),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    fillColor: Colors.black54,
                    filled: true,
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(left: 35, right: 35, top:10, bottom:10 ),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username/Email',
                    fillColor: Colors.black54,
                    filled: true,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 35, right: 35, top:10, bottom:10 ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    fillColor: Colors.black54,
                    filled: true,
                  ),
                ),
              ),

              RaisedButton(
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text, password: passwordController.text)
                      .then((value){
                        print("Signed Up!!");
                  }).catchError((error){
                        print("Signup failed");
                        print(error.toString());
                  });
                },
                textColor: Colors.white,
                color: Color(0xff99B2DD),
                padding: const EdgeInsets.only(left: 115, right: 115, top:20 , bottom:20 ),
                child: const Text('Create Account'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(title: "login")));
                    },
                    child: Text('Login'),
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

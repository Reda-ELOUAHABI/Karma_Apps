import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/home_screen.dart';
import 'package:fire99/register2.dart';
import 'package:fire99/reset.dart';
import 'package:fire99/screen2.dart';
import 'package:fire99/videoscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/painting.dart';
import 'Helpers/remember_me.dart';
import 'colorr.dart';
import 'register2.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = './login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(

            children: <Widget>[
              Container(
                  width: _width,
            height: _height / 13,
                  child: Center(
                      child: Text(
                    "Banner Adds",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xffA903F8),
                      Color(0xffF805A5).withOpacity(0.29),
                    ],
                  )),
                  //Like the pourcentage exactly
                 ),

              Container(
                height: _height*0.8,
                child: Stack(
                  // fit: BoxFit.cover,
                  children: [
                    Positioned(
                        height: _height / 2.3,
                        width: _width / 1.1,
                        left: _width/20,
                      top: _height/10,
                      /*  left: -_width / 9,
                        top: -_height / 9,*/

                        child: Container(
                          child: Form(
                            key: _formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                TextFormField(
                                  //Email/
                                  controller: _emailcontroller,
                                  cursorColor: Colors.purple,
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                  decoration: InputDecoration(
                                    hoverColor: Colors.deepPurple,
                                    labelText: ' Email',
                                    hintText: 'Enter your email ',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepPurple, width: 2.0),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        borderSide: BorderSide()),
                                    // fillColor: Colors.white,
                                    filled: true,
                                    fillColor: Colors.white,

                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepPurple,
                                    ),
                                    prefixIcon:
                                    Icon(Icons.lock, color: Colors.deepPurple),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Fill Password Input';
                                    }
                                    return null;
                                  },
                                ),

                                TextFormField(
                                  //Password/
                                  cursorColor: Colors.deepPurple,
                                  obscureText: true,
                                  controller: _passwordcontroller,
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                  decoration: InputDecoration(
                                    labelText: ' Password',
                                    hintText: 'Enter your password ',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepPurple, width: 2.0),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        borderSide: BorderSide()),
                                    // fillColor: Colors.white,
                                    filled: true,
                                    fillColor: Colors.white,

                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepPurple,
                                    ),
                                    prefixIcon:
                                    Icon(Icons.lock, color: Colors.deepPurple),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Fill Password Input';
                                    }
                                    return null;
                                  },
                                ),
Padding(
  padding: const EdgeInsets.only(left:200),
  child:   TextButton(onPressed: null, child: Text("Forget Password")),
)

                                // Container(
                                //   height: _height,
                                //   width: 50,
                                //   color: Colors.red,
                                // ),

                                // Container(
                                //   height: _height,
                                //   width: _width,
                                //   color: Colors.blue,
                                // ),

                              ],
                            ),
                          ),

                          decoration: BoxDecoration(
                            //Only some corners
                            // borderRadius: BorderRadius.only(
                            //     topLeft: Radius.circular(15),
                            //     bottomLeft: Radius.circular(15)),
                            
                            borderRadius: BorderRadius.all(Radius.circular(16)),

                              border: Border
                             /*Sol 1*/
                              //   (
                             //   top: BorderSide( color: Color(0xFFDFDFDF)),
                             //   left: BorderSide( color: Color( 0xFFDB60CA)),
                             //   right: BorderSide( color: Color(0xFFDB60CA)),
                             //   bottom: BorderSide( color: Color(
                             //       0xFFB508E2)),
                             // ),
/*Sol 2*/

                                  .all(width: 2.0, color: const Color(0xFFFFFFFF)),
                           // color: Colors.deepPurple,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff3965fa),
                                  blurRadius: 16,
                                  spreadRadius: 10,
                                  //offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xffFD067D).withOpacity(0.9),
                                  Color(0xff4200FF).withOpacity(0.65),
                                ],
                              )),
                          //color: Colors.red,
                        )),
                    Positioned(
                      //  height: _height,
                      child: Container(
                        width: 400,
                        height: 150,
                        color: Colors.lightBlueAccent[300],
                        child: Image.asset('assets/Group 598 1.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: _width,
                height: _height / 13,
                child: Center(
                    child: Text(
                      "Banner Adds",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xffA903F8),
                        Color(0xffF805A5).withOpacity(0.29),
                      ],
                    )),
                //Like the pourcentage exactly
              ),


            ],
          ),
        ));
  }

  Future<void> sginInWithGoogle() async /* Sgin in with google method*/
  {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  }
}

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
          child: SingleChildScrollView(
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
                  height: _height * 0.8,
                  child: Stack(
                    // fit: BoxFit.cover,
                    children: [
                      Positioned(
                          height: _height / 2.3,
                          width: _width / 1.1,
                          left: _width / 20,
                          top: _height / 10,
                          /*  left: -_width / 9,
                          top: -_height / 9,*/

                          child: Container(
                            child: Form(
                              key: _formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [



                                  Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Container(
                               //Container for box shadow + blur
                                  decoration: BoxDecoration(
                                    boxShadow:
                                    [
                                      BoxShadow(
                                        color: Color(0xff2f2e2e),
                                        blurRadius: 46,
                                        //spreadRadius: 100,
                                        offset: Offset(4, 8), // Shadow position
                                      ),
                                    ],
                                  ),

                                  //Material fox box shadow 2
                                  child: Material(
                                    elevation: 1.0,
                                    shadowColor: Colors.purpleAccent,
                                    color: Colors.transparent,
                                    child: TextFormField(
                                      //input txt color
                                      style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(


                                    border: OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.teal)
                                    ),
                                      labelText: 'User name',
                                      labelStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,

                                        ),
                                      ),
                            ),


                                      //validation ..

                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Fill Password Input';
                                        }
                                        return null;
                                      },
                                      controller: _emailcontroller,

                          ),
                                  ),
                                ),
                              ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Container(
                                      //Container for box shadow + blur
                                      decoration: BoxDecoration(
                                        boxShadow:
                                        [
                                          BoxShadow(
                                            color: Color(0xff2f2e2e),
                                            blurRadius: 46,
                                            //spreadRadius: 100,
                                            offset: Offset(4, 8), // Shadow position
                                          ),
                                        ],
                                      ),

                                      //Material fox box shadow 2
                                      child: Material(
                                        elevation: 1.0,
                                        shadowColor: Colors.purpleAccent,
                                        color: Colors.transparent,
                                        child: TextFormField(
                                          //input txt color
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(


                                            border: OutlineInputBorder(
                                                borderSide: new BorderSide(color: Colors.teal)
                                            ),
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),

                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0,

                                              ),
                                            ),
                                          ),


                                          //validation ..

                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Fill Password Input';
                                            }
                                            return null;
                                          },
                                          //hide password
                                          obscureText: true,
                                          controller: _passwordcontroller,

                                        ),
                                      ),
                                    ),
                                  ),
                                  


                                  //Forget Password btn
                                  Padding(
                                    padding: const EdgeInsets.only(left: 200),
                                    child:
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.blue.withOpacity(0.1),
                                            blurRadius: 1,
                                            offset: Offset(10, 10),
                                          ),
                                        ],
                                      ),
                                      child: RaisedButton(
                                        elevation: 30,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16.0),
                                            side: BorderSide(color:

                                            Color.fromRGBO(
                                                78, 78, 78, 1.0))),
                                        onPressed: () {},
                                        padding: EdgeInsets.all(10.0),
                                        color: Color.fromRGBO(
                                            102, 102, 102, 0.8941176470588236),
                                        textColor: Colors.white,
                                        child: Text(
                                            "forget password",
                                            //"Shadow Butoon".toUpperCase(),
                                            style: TextStyle(fontSize: 15)),
                                      ),
                                    ),
                                    // TextButton(
                                    //     onPressed: null,
                                    //     child: Text("Forget Password"),
                                    // ),
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

                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
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

                                    .all(
                                        width: 2.0,
                                        color: const Color(0xFFFFFFFF)),
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
          ),
        ));
  }

  Future<void> sginInWithGoogle() async /* Sgin in with google method*/
  {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  }
}

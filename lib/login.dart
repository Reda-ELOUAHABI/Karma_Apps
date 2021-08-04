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

                                  SizedBox(height:40 ,),

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
                                    padding: const EdgeInsets.only(
                                        left: 200,
                                        right: 10,
                                    ),
                                    child:
                                    Container(
                                      margin: EdgeInsets.all(1),
                                      height: 30.0,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Color(0xff383838).withOpacity(0.5),
                                            //color: Colors.grey.withOpacity(0.1),
                                            blurRadius: 10,
                                            offset: Offset(-10, 10),
                                          ),
                                        ],
                                      ),
                                      child:
                                      ElevatedButton(
                                        onPressed: () {
                                          // Respond to button press
                                        },
                                        child: Text("forgot password",style: TextStyle(

                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(-10.0, 5.0),
                                              blurRadius: 3.0,
                                              color: Color(0xff89898e),
                                            ),
                                            /*Shadow(
                                              offset: Offset(10.0, 10.0),
                                              blurRadius: 8.0,
                                              color: Color.fromARGB(125, 0, 0, 255),
                                            ),*/
                                          ],

                                        ),),
                                        style:
                                        ButtonStyle(

                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(

                                                    borderRadius: BorderRadius.circular(18.0),
                                                    side: BorderSide(color: Colors.grey),

                                                ),

                                            ),
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(Color(
                                              0xff8B669C)),
                                        ),
                                        // ElevatedButton.styleFrom(
                                        //    primary: Colors.grey,
                                        //   // set the background color
                                        //   // Color onPrimary,
                                        //   // Color onSurface,
                                        //   // Color shadowColor,
                                        //   // double elevation,
                                        //   // TextStyle textStyle,
                                        //   // EdgeInsetsGeometry padding,
                                        //   // Size minimumSize,
                                        //   // BorderSide side,
                                        //   // OutlinedBorder shape,
                                        //   // MouseCursor enabledMouseCursor,
                                        //   // MouseCursor disabledMouseCursor,
                                        //   // VisualDensity visualDensity,
                                        //   // MaterialTapTargetSize tapTargetSize,
                                        //   // Duration animationDuration,
                                        //   // bool enableFeedback
                                        // ),


                                      ),


                                     /* RaisedButton(
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
                                    */

                                    ),
                                    // TextButton(
                                    //     onPressed: null,
                                    //     child: Text("Forget Password"),
                                    // ),
                                  ),

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
                                 /* SizedBox(
                                    height: 50,
                                  ),*/
                                  Container(
                                  /*  margin: EdgeInsets.only(

                                    ),*/
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                        Container(
                                          // margin: EdgeInsets.only(
                                          //
                                          // ),
                                          width: 60,
                                          height: 60,
                                          child: Image.asset("assets/images/facebook.png"),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFe0f2f1)),
                                        ),
                                        Container(
                                          width: 60,
                                          height: 60,
                                          child: Image.asset("assets/images/gmail-02 (1) 1.png",width: _width/1000,),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFe0f2f1)),
                                        ),
                                        Container(
                                            width: 60,
                                            height: 60,
                                            child: Image.asset("assets/images/25231.png",),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFe0f2f1)),
                          ),

                                      ],
                                    ),
                                  ),
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

                      Positioned(
                        top: _height/1.6,
                        left: _width/3.8,
                        //  height: _height,
                        child: Container(
                          margin: EdgeInsets.all(1),
                          height: 40.0,
                          width: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xffA903F8),
                                Color(0xffF805A5).withOpacity(0.29),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color(0xffAD23DD).withOpacity(0.5),
                                //color: Colors.grey.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(-10, 10),
                              ),
                            ],
                          ),
                          child:
                          ElevatedButton(
                            onPressed: () {
                              // Respond to button press
                            },
                            child: Text("Log in",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1
                                ..color = Color(0xffcd99e8),
                              //fontFamily: pacifi,

                              shadows: <Shadow>[
                                Shadow(
                                 offset: Offset(-10.0, 5.0),
                                  blurRadius: 33.0,
                                  color: Color(0xffffffff),
                                ),
                                /*Shadow(
                                            offset: Offset(10.0, 10.0),
                                            blurRadius: 8.0,
                                            color: Color.fromARGB(125, 0, 0, 255),
                                          ),*/
                              ],

                            ),),
                            style:
                            ButtonStyle(

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white),

                                ),

                              ),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(

                                  Color(
                                      0xff9104FF),


                              ),
                            ),
                            // ElevatedButton.styleFrom(
                            //    primary: Colors.grey,
                            //   // set the background color
                            //   // Color onPrimary,
                            //   // Color onSurface,
                            //   // Color shadowColor,
                            //   // double elevation,
                            //   // TextStyle textStyle,
                            //   // EdgeInsetsGeometry padding,
                            //   // Size minimumSize,
                            //   // BorderSide side,
                            //   // OutlinedBorder shape,
                            //   // MouseCursor enabledMouseCursor,
                            //   // MouseCursor disabledMouseCursor,
                            //   // VisualDensity visualDensity,
                            //   // MaterialTapTargetSize tapTargetSize,
                            //   // Duration animationDuration,
                            //   // bool enableFeedback
                            // ),


                          ),


                          /* RaisedButton(
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
                                  */

                        ),
                      ),
                    ],
                  ),
                ),

                //Banner Ads
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
                  ),
                  ),
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

import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/colorr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Helpers/remember_me.dart';
import 'colorr.dart';

class Profile extends StatefulWidget {
  final String ud;

  Profile(this.ud);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<Profile> {
  String allposts;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  String v;
  Future resultsLoaded;
  final _nativeAd = NativeAdmobController();
  AdmobBannerSize bannerSize;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobInterstitial intersitialAd;
  String emailId;

  @override
  initState() {
    setState(() {});
    super.initState();
    handleEmailId();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      callBack();
    });

    bannerSize = AdmobBannerSize.BANNER;

    intersitialAd = AdmobInterstitial(
        adUnitId: AdmobInterstitial.testAdUnitId,
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) intersitialAd.load();
          //  handleEvent(event, args, 'Interstitial');
        });
    _nativeAd.reloadAd(forceRefresh: true);
    intersitialAd.load();
  }

  callBack() {
    setState(() {});
  }

  handleEmailId() async {
    emailId = await getEmail();
  }

  @override
  void dispose() {
    intersitialAd.dispose();
    _nativeAd.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var StyleBox= BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color(0xffffffff).withOpacity(0.3),
          blurRadius: 7,
          spreadRadius: 1,
          offset: Offset(0, 4), // Shadow position
        ),
      ],
      border: Border.all(
        color: Colors.white,
      ),
    );
    // final user = FirebaseAuth.instance.currentUser;
    // final userData =
    //     FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _width,
              height: _height / 19,
              child: Center(child: SizedBox()),

              //Like the pourcentage exactly
            ),
            Container(
              //how much banner in bottom
              height: _height * 0.83,
              child: Stack(
                // fit: BoxFit.cover,
                children: [
                  Positioned(
                      //the box height !!
                      height: _height / 1.45,
                      width: _width / 1.1,
                      left: _width / 20,
                      top: _height / 10,

                      /*  left: -_width / 9,
                          top: -_height / 9,*/

                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Container(
                                child: Row(
                                  //to position the last elemt
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18.0),
                                      child: Container(
                                        // margin: EdgeInsets.only(
                                        //
                                        // ),
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                          "assets/images/Ellipse 4.png",
                                          scale: 0.5,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFe0f2f1),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: Color(0xffAD23DD)
                                                    .withOpacity(0.5),
                                                //color: Colors.grey.withOpacity(0.1),
                                                blurRadius: 10,
                                                offset: Offset(-10, 10),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 50,
                                        right: 0,
                                      ),
                                      child: Container(
                                        height: _height/14,
                                        width: _width/3,
                                        margin: EdgeInsets.only(
                                          left: 8,
                                          right: 0,
                                        ),
                                        //Container for box shadow + blur
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xffffffff)
                                                  .withOpacity(0.3),
                                              blurRadius: 7,
                                              spreadRadius: 1,
                                              offset: Offset(
                                                  0, 4), // Shadow position
                                            ),
                                          ],
                                        ),

                                        //Material fox box shadow 2
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Respond to button press
                                          },
                                          child: Text(
                                            "jan mennisy",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              //letterSpacing: 10,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(-10.0, 5.0),
                                                  blurRadius: 10.0,
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.5),
                                                ),
                                              ],
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  bottomLeft: Radius.circular(30)
                                                  
                                                ),
                                                side: BorderSide(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    Color(0xffC80B7C)
                                                        .withOpacity(1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                height: _height / 4.5,
                                //Container for box shadow + blur
                                decoration:
                                  StyleBox,
                                //Material fox box shadow 2
                                child: Text(
                                  "Jons Info",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    letterSpacing: 10,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(-10.0, 5.0),
                                        blurRadius: 10.0,
                                        color: Color(0xff000000)
                                            .withOpacity(0.5),
                                      ),
                                    ],
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
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffffffff).withOpacity(0.3),
                                      blurRadius: 7,
                                      spreadRadius: 1,
                                      offset: Offset(0, 4), // Shadow position
                                    ),
                                  ],
                                ),

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Respond to button press
                                  },
                                  child: Text(
                                    "HELP",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      letterSpacing: 10,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(-10.0, 5.0),
                                          blurRadius: 10.0,
                                          color: Color(0xff000000)
                                              .withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        //borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xff8B669C).withOpacity(1)),
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
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffffffff).withOpacity(0.3),
                                      blurRadius: 7,
                                      spreadRadius: 1,
                                      offset: Offset(0, 4), // Shadow position
                                    ),
                                  ],
                                ),

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Respond to button press
                                  },
                                  child: Text(
                                    "CONTACT US",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      letterSpacing: 10,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(-10.0, 5.0),
                                          blurRadius: 10.0,
                                          color: Color(0xff000000)
                                              .withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        //borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xff8B669C).withOpacity(1)),
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
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffffffff).withOpacity(0.3),
                                      blurRadius: 7,
                                      spreadRadius: 1,
                                      offset: Offset(0, 4), // Shadow position
                                    ),
                                  ],
                                ),

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed: () async {

                                  },
                                  child: Text(
                                    "REPORT PROBLEM",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      letterSpacing: 6,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(-10.0, 5.0),
                                          blurRadius: 10.0,
                                          color: Color(0xff000000)
                                              .withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        //borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xff8B669C).withOpacity(1)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //The box itself
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            border: Border.all(
                                width: 2.0, color: const Color(0xFFFFFFFF)),
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
                    top: 10,
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
            ),
          ],
        ),
      ),
    ));
    /* Scaffold(
      backgroundColor: Color.fromRGBO(41, 30, 83, 1),
      appBar: AppBar(
          backgroundColor: btnforGroundColr,
          title: (Center(
              child: Row(
            children: [
              SizedBox(
                width: 40,
              ),
              */ /* Container(
                 width:80,
                 child:Image.asset('assets/l1.jfif')
               ),*/ /*
              Text("Deal",
                  style: TextStyle(
                      color: kPrimaryLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 23)),
              Text("K",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 23)),
              Text("arma",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23)),

              //  Text("  Broker",style:TextStyle(color:Colors.lightBlue,fontWeight:FontWeight.bold,fontSize:21)),
            ],
          ))),
          actions: <Widget>[
            InkWell(
                child: Icon(Icons.logout),
                onTap: () async {
                  FirebaseAuth fBase = FirebaseAuth.instance;
                  await fBase.signOut();
                  SharedPreferences prefs = await getSharedPrefs();
                  await clearPrefs(context, prefs);
                }),
            SizedBox(
              width: 20,
            ),
          ]),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where("email", isEqualTo: emailId)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) {
              return Container();
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else
              print(snapshot.data.docs.length);
            return Container(
                color: Color(0xFF6F35A5),
                child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot posts = snapshot.data.docs[index];
                      int len = snapshot.data.docs.length;
                      if (snapshot.data == null)
                        return CircularProgressIndicator();
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [btnforGroundColr, btnbackGroundColr],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                SizedBox(width: 40),
                                Container(
                                    child: Text(
                                  'Welcome ' +
                                      posts.data()['username'] +
                                      ' to DealKarma ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic),
                                )),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.ac_unit_rounded,
                                  color: Colors.cyanAccent,
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 100,
                                  height: 112,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.lightBlue,
                                        Colors.lightBlue[300],
                                      ],
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(70)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    posts.data()['username'][0],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900),
                                  )),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Column(
                                  children: [
                                    Container(
                                        child: Text(
                                      posts.data()['coins'],
                                      style: TextStyle(
                                          color: Colors.cyanAccent,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900),
                                    )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        child: Text(
                                      "Coins",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Stack(
                                overflow: Overflow.visible,
                                children: [
                                  Transform(
                                    transform: Matrix4.skewY(-0.05),
                                    child: Container(
                                      padding: EdgeInsets.all(24),
                                      height: 310,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.purpleAccent[200],
                                            Colors.blue
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Convert your coins for ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          ' cell service',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          posts.data()['username'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          posts.data()['email'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Save your money ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "and collect coins now! ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 57, right: 15, left: 70),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 190,
                                    left: 210,
                                    child: Image(
                                      image: AssetImage('assets/t1.png'),
                                      height: 182,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }));
          }),
    );*/
  }
}

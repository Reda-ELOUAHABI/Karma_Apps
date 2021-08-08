import 'package:flutter/material.dart';
class  extends StatefulWidget {
  const ({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<> {
  @override
  Widget build(BuildContext context) {
    return
    Container(
    child: StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: emailId)
        .snapshots(),
    builder: (context,
    AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.data == null) {
    return Container();
    }
    if (!snapshot.hasData) {
    return Center(
    child: CircularProgressIndicator());
    } else
    print(snapshot.data.docs.length);

    return Container(
    child: ListView.builder(
    itemCount: snapshot.data.docs.length,
    itemBuilder: (context, index) {
    DocumentSnapshot posts = snapshot.data.docs[index];
    int len = snapshot.data.docs.length;
    if (snapshot.data == null)
    return CircularProgressIndicator();
    return Container(

    child:

    Column(

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
    padding: const EdgeInsets.only(
    left: 18.0),
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
    height: _height / 14,
    width: _width / 3,
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
    offset: Offset(0,
    4), // Shadow position
    ),
    ],
    ),

    //Material fox box shadow 2
    child: ElevatedButton(
    onPressed: () {
    // Respond to button press
    },
    child: Text(
    posts.data()['username'],
    style: TextStyle(
    color: Colors.white,
    fontSize: 15,
    //letterSpacing: 10,
    shadows: <Shadow>[
    Shadow(
    offset:
    Offset(-10.0, 5.0),
    blurRadius: 10.0,
    color: Color(0xff000000)
        .withOpacity(0.5),
    ),
    ],
    ),
    ),
    style: ButtonStyle(
    shape:
    MaterialStateProperty.all<
    RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius:
    BorderRadius.only(
    topLeft: Radius
        .circular(30),
    bottomLeft: Radius
        .circular(
    30)),
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
    decoration: StyleBox,
    //Material fox box shadow 2
    child: Text(
    "User Info"
    + posts.data()['username']
    + posts.data()['coins']
    + posts.data()['email'],
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

    ],
    ),
    );
    }));


    }),
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
)
    ;
  }
}


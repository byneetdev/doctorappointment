import 'package:doctorappointment/categories.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.roboto().toString(),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.pink,
                    height: 160,
                    padding: EdgeInsets.only(bottom: 50.0, left: 15.0),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Hello, Cindy Yuvia\nWhat happen with you?",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Categories",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          width: double.infinity,
                          height: 150.0,
                          child: Categories(),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          "What are you looking for?",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              buildCard(
                                "images/clock.png",
                                0xFFF4D0C2,
                                "Doctor",
                                "Book an Appointment",
                                "50 Doctors available",
                                context,
                              ),
                              SizedBox(height: 5.0),
                              buildCard(
                                "images/stethoscope.png",
                                0xFFB9D696,
                                "Test & Checkup",
                                "Lab Test & Checkup",
                                "42 Diagnostic are available",
                                context,
                              ),
                              SizedBox(height: 5.0),
                              buildCard(
                                "images/chat.png",
                                0xFF7AC2D8,
                                "Chat & Video Call",
                                "Online Health Consult",
                                "Get help with Chat and Video Call",
                                context,
                              ),
                              SizedBox(height: 5.0),
                              buildCard(
                                "images/videocall.png",
                                0xFFF3AC76,
                                "Event & Health Seminar",
                                "Video Conference",
                                "3 Conference coming soon",
                                context,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildCard(String urlIcon, int color, String category, String name,
    String description, BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    elevation: 7,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Color(color),
            ),
            child: Center(
              child: Image.asset(
                urlIcon,
                width: 40,
                height: 40,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(category,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: Colors.black54,
                    )),
                Text(name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                Text(description,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black54,
                    )),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyCategories.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final category = dummyCategories[index];

        return Container(
          width: 200,
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: AssetImage(category.urlimage),
                fit: BoxFit.cover,
              )),
          child: Stack(
            children: <Widget>[
              Container(
                width: 200,
                height: 150,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 17.0,
                      backgroundImage: AssetImage(category.iconImage),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      width: 130,
                      child: Text(
                        category.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.arvo(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

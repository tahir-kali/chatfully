import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class Chatting extends StatefulWidget {
  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text(
          "Chris Or",
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: appColor,
      ),
      body: ListView(
        children: <Widget>[

          
        ],
      ),
      
      
    );
  }
}
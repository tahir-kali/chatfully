import 'package:chatfully/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  Radius radius = Radius.circular(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee5e5),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Color(0xff90EE90),
              radius: 15,
              child: Text(
                "3",
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
        title: Text(
          "Chris Or",
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: appColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 11,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Sender(
                      radius: radius,
                      message:
                          'Lorem ipsum dolor sit amet, consectetur\nadipisicing aut fugit, sed quia a consequuntur.',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Reciever(
                      radius: radius,
                      message: 'Hey!!',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Reciever(
                      radius: radius,
                      message: 'I want your help.',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Reciever(
                      radius: radius,
                      message: 'Call me right now',
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 20,
              child: Row(
                children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Icon(Icons.wallpaper, color: Color(0xFF4d4d4d),size: 50,),
                   ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 5.0,
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      width: SizeConfig.blockSizeVertical * 41,
                      height: 50,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Reciever extends StatelessWidget {
  Reciever({this.message, this.radius});

  final message;
  final Radius radius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: Color(0xFF81d8db),
                borderRadius: BorderRadius.only(
                    topRight: radius, topLeft: radius, bottomRight: radius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '17h',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

class Sender extends StatelessWidget {
  Sender({this.message, this.radius});
  final message;
  final Radius radius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 280,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: Color(0xFFbbbbbb),
                borderRadius: BorderRadius.only(
                  topRight: radius,
                  topLeft: radius,
                  bottomLeft: radius,
                )),
            child: Column(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '17h',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

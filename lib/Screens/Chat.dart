import 'package:chatfully/Screens/ChatPerson.dart';
import 'package:chatfully/Screens/Filters.dart';
import 'package:chatfully/Screens/NewMessage.dart';
import 'package:chatfully/Screens/Notifications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '../size.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Color(0xff242A32),
      appBar: AppBar(
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
        centerTitle: true,
        title: Text(
          "Chatfully",
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: appColor,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.blockSizeVertical * 30,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                    ),
                    Text(
                      "CJ Terral",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Filters()),
                );
              },
              title: Text(
                "Filters",
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsScreen()),
                );
              },
              title: Text(
                "Notifications",
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 42,
            ),
            ListTile(
              title: Text(
                "Logout",
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Chats",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
                GestureDetector(
                  onTap: (){
                       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewMessage()),
  );


                  },
                                  child: Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 1,
            endIndent: 15,
            indent: 15,
          ),
          GestureDetector
          (
            onTap: (){
                        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Message()),
  );

            },
            
            
            child: Chatin()),
          Chatin(),
          Chatin(),
          Chatin(),
        ],
      ),
    );
  }
}

class Chatin extends StatelessWidget {
  const Chatin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Chris 09",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                Text(
                  "0m",
                  style: GoogleFonts.lato(color: Colors.white),
                )
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Hi, do you ship to Hawaii?",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 5.5,
                  decoration: BoxDecoration(
                      color: Color(0xff90EE90),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    "2",
                    style: GoogleFonts.lato(color: Colors.white),
                  )),
                )
              ],
            ),
          ),
          leading: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 26,
              ),
              Icon(FontAwesomeIcons.facebookMessenger,color: appColor,size: 20,),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 1,
          endIndent: 15,
          indent: 15,
        ),
      ],
    );
  }
}

import 'package:chatfully/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text(
          "All People",
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: appColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: SizeConfig.blockSizeVertical  * 7 ,
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 15,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 74,
                    height: 50,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(FontAwesomeIcons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  
                ),
              ),
            ),


          
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 5),
              child: Text(
                "A",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 22,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Colors.green,
                    size: 15,
                  ),
                ],
              ),
              title: Text(
                "Abel Carrasco",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("abel.carrasoco.5070"),
              trailing: Icon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 22,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Colors.green,
                    size: 15,
                  ),
                ],
              ),
              title: Text(
                "Abel Carrasco",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("abel.carrasoco.5070"),
              trailing: Icon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 22,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Colors.green,
                    size: 15,
                  ),
                ],
              ),
              title: Text(
                "Abel Carrasco",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("abel.carrasoco.5070"),
              trailing: Icon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 22,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Colors.green,
                    size: 15,
                  ),
                ],
              ),
              title: Text(
                "Abel Carrasco",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("abel.carrasoco.5070"),
              trailing: Icon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 22,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Colors.green,
                    size: 15,
                  ),
                ],
              ),
              title: Text(
                "Abel Carrasco",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("abel.carrasoco.5070"),
              trailing: Icon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

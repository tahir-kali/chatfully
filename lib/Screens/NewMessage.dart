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
      backgroundColor: Color(0xffDDE5E5),
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
          "New Message",
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: appColor,
      ),

      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(15),
            child: Text("From", style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              fontSize: 18
            ),),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15
            ),
            child: Container(
              height: SizeConfig.blockSizeVertical * 9,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),


              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: <Widget>[

                        Text("Main Phone Number", style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                        ),),
                        Icon(Icons.arrow_drop_down)



                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("+1 (800) 555-4444", style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                            ),),
                      ],
                    )

                    
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text("To", style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              fontSize: 18
            ),),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15
            ),
            child: Container(
              height: SizeConfig.blockSizeVertical * 7.5,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),


              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),

              ),
            ),
          )



        ],
      ),
      
    );
  }
}
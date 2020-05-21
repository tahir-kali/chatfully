import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '../size.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
            backgroundColor: Color(0xffDDE5E5),

      appBar: AppBar(
        title: Text(
          "Filters",
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: appColor,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Chat Status (Disposition)",
              style:
                  GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: SizeConfig.blockSizeVertical * 5.8,
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
                        Text(
                          "Open",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff676767) ),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Team Inboxes",
              style:
                  GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Container(
              height: SizeConfig.blockSizeVertical * 5.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Partnerships",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff676767)),
                          ),
                         
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            child: Container(
              height: SizeConfig.blockSizeVertical * 5.8,
              decoration: BoxDecoration(
                color: Color(0xff434343),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Marketing",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
                          ),
                         
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            child: Container(
              height: SizeConfig.blockSizeVertical * 5.8,
              decoration: BoxDecoration(
                color: Color(0xff434343),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:EdgeInsets.only(top: SizeConfig.blockSizeVertical * 0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Sales",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
                          ),
                         
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            child: Container(
              height: SizeConfig.blockSizeVertical * 5.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Customer Success",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff676767)),
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

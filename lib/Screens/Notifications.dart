import 'package:chatfully/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Color border = Colors.grey;
  Color container = Color(0xff434343);
  Color text = Colors.white;

  String startTime;

  String endTime;
  Future<TimeOfDay> _selectedTimeStart(BuildContext context) => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 2, minute: 45),
      );
  Future<TimeOfDay> _selectedTimeStart2(BuildContext context) => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 2, minute: 45),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime =
        DateTime.now().hour.toString() + ":" + DateTime.now().second.toString();
    endTime =
        DateTime.now().hour.toString() + ":" + DateTime.now().second.toString();
  }

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
          "Notifications",
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: appColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20  ),
        child: ListView(
          children: <Widget>[
            Text(
              "Allow Notifications",
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Table(
              children: <TableRow>[
                TableRow(children: [
                  TableCell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: SizeConfig.blockSizeVertical * 4,
                        width: SizeConfig.blockSizeHorizontal * 27,
                        child: Text(
                          "Day(s)",
                          style: GoogleFonts.lato(fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical * 4,
                        width: SizeConfig.blockSizeHorizontal * 21,
                        child: Text(
                          "From",
                          style: GoogleFonts.lato(fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical * 4,
                        width: SizeConfig.blockSizeHorizontal * 21,
                        child: Text(
                          "To",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                          height: SizeConfig.blockSizeVertical * 4,
                          width: SizeConfig.blockSizeHorizontal * 2,
                          child: Text("")),
                    ],
                  ))
                ]),
                TableRow(children: [
                  TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: SizeConfig.blockSizeVertical * 4,
                          width: SizeConfig.blockSizeHorizontal * 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: new DropdownButton<String>(
                            underline: SizedBox(),
                            dropdownColor: Colors.white,
                            focusColor: Colors.white,
                            value: "Everyday",
                            items: <String>[
                              'Monday',
                              'Tuesday',
                              'Wednesday',
                              'Thursday',
                              "Friday",
                              "Saturday",
                              "Sunday",
                              "Everyday"
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 4  ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            height: SizeConfig.blockSizeVertical * 4,
                            width: SizeConfig.blockSizeHorizontal * 21,
                            child: new DropdownButton<String>(
                              underline: SizedBox(),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              value: "1:00 PM",
                              items: <String>[
                                '1:00 PM',
                                "1:30 PM",
                                '1:00 AM',
                                "1:30 AM",
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            height: SizeConfig.blockSizeVertical * 4,
                            width: SizeConfig.blockSizeHorizontal * 21,
                            child: new DropdownButton<String>(
                              underline: SizedBox(),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              value: "1:00 PM",
                              items: <String>[
                                '1:00 PM',
                                "1:30 PM",
                                '1:00 AM',
                                "1:30 AM",
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                        Container(
                            height: SizeConfig.blockSizeVertical * 4,
                            width: SizeConfig.blockSizeHorizontal * 2,
                            child: IconButton(
                                icon: Icon(Icons.delete), onPressed: null))
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal * 27,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: container,
                                border: Border.all(color: border)),
                            child: Center(
                              child: Text(
                                "Ring/Vibrate",
                                style: GoogleFonts.lato(color: text),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal * 21,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: container,
                                border: Border.all(color: border)),
                            child: Center(
                              child: Text(
                                "Delay",
                                style: GoogleFonts.lato(color: text),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal * 21,
                          
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal *2,
                            
                            
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ]),
                TableRow(children: [
                  TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: SizeConfig.blockSizeVertical * 4,
                          width: SizeConfig.blockSizeHorizontal * 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: new DropdownButton<String>(
                            underline: SizedBox(),
                            dropdownColor: Colors.white,
                            focusColor: Colors.white,
                            value: "Everyday",
                            items: <String>[
                              'Monday',
                              'Tuesday',
                              'Wednesday',
                              'Thursday',
                              "Friday",
                              "Saturday",
                              "Sunday",
                              "Everyday"
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 4 ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            height: SizeConfig.blockSizeVertical * 4,
                            width: SizeConfig.blockSizeHorizontal * 21,
                            child: new DropdownButton<String>(
                              underline: SizedBox(),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              value: "1:00 PM",
                              items: <String>[
                                '1:00 PM',
                                "1:30 PM",
                                '1:00 AM',
                                "1:30 AM",
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            height: SizeConfig.blockSizeVertical * 4,
                            width: SizeConfig.blockSizeHorizontal * 21,
                            child: new DropdownButton<String>(
                              underline: SizedBox(),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              value: "1:00 PM",
                              items: <String>[
                                '1:00 PM',
                                "1:30 PM",
                                '1:00 AM',
                                "1:30 AM",
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                        Container(
                            height: SizeConfig.blockSizeVertical * 4,
                            width: SizeConfig.blockSizeHorizontal * 2,
                            child: IconButton(
                                icon: Icon(Icons.delete), onPressed: null))
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal * 27,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: container,
                                border: Border.all(color: border)),
                            child: Center(
                              child: Text(
                                "Ring/Vibrate",
                                style: GoogleFonts.lato(color: text),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal * 21,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: container,
                                border: Border.all(color: border)),
                            child: Center(
                              child: Text(
                                "Delay",
                                style: GoogleFonts.lato(color: text),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal * 21,
                          
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal *2,
                            
                            
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ]),
                TableRow(children: [
                  TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: SizeConfig.blockSizeVertical * 4,
                          width: SizeConfig.blockSizeHorizontal * 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: new DropdownButton<String>(
                            underline: SizedBox(),
                            dropdownColor: Colors.white,
                            focusColor: Colors.white,
                            value: "Everyday",
                            items: <String>[
                              'Monday',
                              'Tuesday',
                              'Wednesday',
                              'Thursday',
                              "Friday",
                              "Saturday",
                              "Sunday",
                              "Everyday"
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 4 ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            height: SizeConfig.blockSizeVertical * 4,
                            width: SizeConfig.blockSizeHorizontal * 21,
                            child: new DropdownButton<String>(
                              underline: SizedBox(),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              value: "1:00 PM",
                              items: <String>[
                                '1:00 PM',
                                "1:30 PM",
                                '1:00 AM',
                                "1:30 AM",
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            height: SizeConfig.blockSizeVertical * 4,
                            width: SizeConfig.blockSizeHorizontal * 21,
                            child: new DropdownButton<String>(
                              underline: SizedBox(),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              value: "1:00 PM",
                              items: <String>[
                                '1:00 PM',
                                "1:30 PM",
                                '1:00 AM',
                                "1:30 AM",
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                        Container(
                            height: SizeConfig.blockSizeVertical * 4,
                            width: SizeConfig.blockSizeHorizontal * 2,
                            child: IconButton(
                                icon: Icon(Icons.delete), onPressed: null))
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal * 27,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: container,
                                border: Border.all(color: border)),
                            child: Center(
                              child: Text(
                                "Ring/Vibrate",
                                style: GoogleFonts.lato(color: text),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal * 21,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: container,
                                border: Border.all(color: border)),
                            child: Center(
                              child: Text(
                                "Delay",
                                style: GoogleFonts.lato(color: text),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal * 21,
                          
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 3,
                            width: SizeConfig.blockSizeHorizontal *2,
                            
                            
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ]),

                TableRow(
                  children: [
                    TableCell(child: Padding(
                      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical  * 2, horizontal: SizeConfig.blockSizeHorizontal  * 2),
                      child: Row(
                children: <Widget>[
                  GestureDetector(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 28,
                        decoration: BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            "+ Add",
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                  ),
                ],
              ),
                    ),)
                  ]
                )
              ]
            ),
           
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '../size.dart';
import '../textField.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
            SizeConfig().init(context);

    return Scaffold(
         appBar: AppBar(
         centerTitle: true,
        title: Text(
          "Chatfully",
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: appColor,
      ),

      body: ListView(
        children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFields(
               hintText: "Email",
               secureText: false,
               icon: Tab(
              icon: Icon(Icons.email),
          ),),
            ),

              Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical  * 3
            ),
            child: Center(
              child: GestureDetector(
                onTap: (){
    

                },
                              child: Container(
                  height: SizeConfig.blockSizeVertical * 7,
                  width: SizeConfig.blockSizeHorizontal *80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: appColor

                  ),
                  child: Center(
                    child: Text("Request", style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 28
                    ),),
                  ),
                ),
              ),
            ),
          ),
          
        

        ],
      ),
      
    );
  }
}
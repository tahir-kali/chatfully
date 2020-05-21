import 'package:chatfully/textField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '../size.dart';
import 'Chat.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
        SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: appColor,
      ),
      body: ListView(
        children: <Widget>[
            Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Register",
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
          ),

          TextFields(icon: Tab(
            icon: Icon(Icons.supervised_user_circle),
          ), hintText: "Name", context: null, secureText:false),


           TextFields(
             secureText: false,
             hintText: "Username",
             
             icon: Tab(
            icon: Icon(Icons.verified_user),

          )),

           TextFields(
             hintText: "Password",
             secureText: false,
             icon: Tab(
            icon: Icon(Icons.lock),
          ),),


          SizedBox(
            height: SizeConfig.blockSizeVertical * 38,
          ),

           Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical  * 3
            ),
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChatScreen()),
  );

                },
                              child: Container(
                  height: SizeConfig.blockSizeVertical * 7,
                  width: SizeConfig.blockSizeHorizontal *80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: appColor

                  ),
                  child: Center(
                    child: Text("SignUp", style: GoogleFonts.lato(
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
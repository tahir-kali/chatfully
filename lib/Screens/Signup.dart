import 'package:chatfully/Screens/Chat.dart';
import 'package:chatfully/Screens/ForgetPassword.dart';
import 'package:chatfully/Screens/Signup.dart';
import 'package:chatfully/colors.dart';
import 'package:chatfully/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: appColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.asset('assets/logo.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 10,
                vertical: SizeConfig.blockSizeVertical * 2),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Name",
                  focusedBorder: InputBorder.none,
                  hintStyle: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 10,
                vertical: SizeConfig.blockSizeVertical * 2),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.verified_user,
                    color: Colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Username",
                  focusedBorder: InputBorder.none,
                  hintStyle: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 10,
                vertical: SizeConfig.blockSizeVertical * 2),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  focusedBorder: InputBorder.none,
                  hintStyle: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 3),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );
                },
                child: Container(
                  height: SizeConfig.blockSizeVertical * 7,
                  width: SizeConfig.blockSizeHorizontal * 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      "Signup",
                      style: GoogleFonts.lato(color: appColor, fontSize: 24),
                    ),
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

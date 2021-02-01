import 'dart:convert';
import 'dart:developer';

import 'package:chatfully/Dialogs.dart';
import 'package:chatfully/Global.dart';
import 'package:chatfully/Screens/Chat.dart';
import 'package:chatfully/Screens/ForgetPassword.dart';
import 'package:chatfully/Screens/Signup.dart';
import 'package:chatfully/colors.dart';
import 'package:chatfully/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String hintUsername = "Username";
  String hintPassword = "Password";
  String userNames = "";
  String password = "";
  var isLoading = false;
  var jsonData;
  //aleksaigovwork@gmail.com
  //leavemealone123Q!
  signIn(String userName, String pass) async {
    setState(() {
      this.isLoading = true;
    });
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    Map data = {"u": userNames, "p": password, "dtoken": fcmToken};
    var response =
        await http.post("https://api.chatfully.io/mobile/v1/login", body: data);
    setState(() {
      this.isLoading = false;
    });
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      if (jsonData["ok"] == true) {
        _preferences.setString("s", jsonData["s"]);
        userData = jsonData["s"];
        print(userData);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
      } else {
        var dialog = await Dialogs.yesAbort(
            context, "error", "Incorrect username/password");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(fit: StackFit.loose, children: <Widget>[
      Scaffold(
        backgroundColor: Color(0xff00C7CE),
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
                onChanged: (String name) {
                  //The part changed by Tahir Rahimi
                  setState(() {
                    this.userNames = name;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    border: OutlineInputBorder(),

                    //hintText: "Username",
                    labelText: "Username",
                    labelStyle: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white),
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
                obscureText: true,
                onChanged: (String value) {
                  //The part changed by Tahir Rahimi
                  setState(() {
                    this.password = value;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white),
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
                    this.signIn(this.userNames, this.password);
                  },
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 7,
                    width: SizeConfig.blockSizeHorizontal * 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: GoogleFonts.lato(color: appColor, fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      if (await canLaunch("https://chatfully.io/DataPolicy")) {
                        launch("https://chatfully.io/DataPolicy");
                      }
                    },
                    child: Text(
                      "Terms & Conditions",
                      style:
                          GoogleFonts.lato(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (await canLaunch("https://chatfully.io/reset")) {
                        launch("https://chatfully.io/reset");
                      }
//                                if (await)
                    },
                    child: Text(
                      "Forgot Password?",
                      style:
                          GoogleFonts.lato(color: Colors.white, fontSize: 14),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      AnimatedContainer(
        height: this.isLoading ? MediaQuery.of(context).size.height : 0,
        duration: Duration(milliseconds: 000),
        color: Colors.black.withOpacity(0.2),
        child: SpinKitThreeBounce(
          color: Colors.white,
        ),
      )
    ]);
  }
}

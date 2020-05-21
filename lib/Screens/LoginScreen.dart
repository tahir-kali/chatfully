import 'package:chatfully/Screens/Chat.dart';
import 'package:chatfully/Screens/ForgetPassword.dart';
import 'package:chatfully/Screens/Signup.dart';
import 'package:chatfully/colors.dart';
import 'package:chatfully/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
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
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 10, vertical: SizeConfig.blockSizeVertical * 2),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon:Icon(Icons.email, color: Colors.white,),
                
                 enabledBorder: UnderlineInputBorder(      
    borderSide: BorderSide(color: Colors.white,
    width: 2
    
    ),   
  ),  
                border: OutlineInputBorder(

                  
                ),
                
                
                hintText: "Username",
                
                                 focusedBorder: InputBorder.none,

                hintStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  
                  color: Colors.white
                )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 10, vertical: SizeConfig.blockSizeVertical * 2),
            child: TextField(
              decoration: InputDecoration(
                                prefixIcon:Icon(Icons.lock, color: Colors.white,),

                 enabledBorder: UnderlineInputBorder(      
    borderSide: BorderSide(color: Colors.white,
    width: 2
    
    ),   
  ),  
                border: OutlineInputBorder(
                  
                ),
                hintText: "Password",
                 focusedBorder: InputBorder.none,
        
                hintStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.white
                )
              ),
            ),
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
                    color: Colors.white

                  ),
                  child: Center(
                    child: Text("LOGIN", style: GoogleFonts.lato(
                      color: appColor,
                      fontSize: 24
                    ),),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 16, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              

              InkWell(
                onTap: (){
                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUpScreen()),
  );
                },
                child: Text("Sign up", style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16
                ),),
              ),
                          InkWell(
                            onTap: (){
                                        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ForgetPassword()),
  );

                            },
                                                      child: Text("Forgot Password?", style: GoogleFonts.lato(
                              color: Colors.white,
                                              fontSize: 16

                            ),),
                          )



            ],),
          )
         

        ],
      ),
      
    );
  }
}
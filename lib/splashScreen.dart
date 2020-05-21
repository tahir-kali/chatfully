import 'package:flutter/material.dart';
import 'Screens/LoginScreen.dart';
import 'spscreendart.dart'
;
import 'colors.dart';

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}




class _SplashScreensState extends State<SplashScreens> {
  bool check = false;
  String uid;
  getScreen() async {

  print(uid);

  if (uid!=null){
    check = true;
  }
  else {
    check = false;
  }

  print(check);
  }
    


  



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScreen();
  }
  @override
  Widget build(BuildContext context) {
    
    return SplashScreen(

      seconds: 4,
      backgroundColor: appColor,
      image: Image.asset("assets/logonew.png"),
      loaderColor: Colors.white,
      navigateAfterSeconds:   LoginScreen() ,
      photoSize: 100,
    );
      
    
  }
}
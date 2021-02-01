import 'dart:convert';
import 'package:chatfully/Dialogs.dart';
import 'package:chatfully/Global.dart';
import 'package:chatfully/Model/ChatListViewModel.dart';
import 'package:chatfully/Model/ChatViewModel.dart';
import 'package:chatfully/Model/MessageChatViewModel.dart';
import 'package:chatfully/Model/MessageListViewModel.dart';
import 'package:chatfully/Model/MessagesViewModel.dart';
import 'package:chatfully/Model/UserViewModel.dart';
import 'package:chatfully/Screens/ChatPerson.dart';
import 'package:chatfully/Screens/Filters.dart';
import 'package:chatfully/Screens/LoginScreen.dart';
import 'package:chatfully/Screens/NewMessage.dart';
import 'package:chatfully/Screens/Notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../colors.dart';
import '../size.dart';
import '../splashScreen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with WidgetsBindingObserver {
  var isLoading = false;
  AppLifecycleState state;
  Stream<LocalNotification> _notificationsStream;

  getUserData() async {
    var jsonData;
    Map<String, String> requestHeaders = {'s': "$userData"};
    var request =
        await http.get("https://api.chatfully.io/mobile/v1/getme?s=$userData");
    if (request.statusCode == 200) {
      setState(() {
        jsonData = json.decode(request.body);
        currentUser = UserViewModel(jsonData["me"]);
      });
    }
  }

  getChatMessage(String id) async {
    setState(() {
      message = messageList.chats.firstWhere((element) => element.id == id);
      this.isLoading = true;
      isNotification = false;
    });
    var jsonData;
    var url = "https://api.chatfully.io/mobile/v1/getmessage?s=$userData&c=$id";

    print("url is ");
    print(url);
    var request = await http
        .get("https://api.chatfully.io/mobile/v1/getmessage?s=$userData&c=$id");

    if (request.statusCode == 200) {
      jsonData = json.decode(request.body);
      if (jsonData["ok"] == true) {
        print(jsonData);
        setState(() {
          currentMessages = MessagesViewModel(jsonData);

          this.isLoading = false;
        });
        if (isChatScreenOpen) {
          Navigator.of(context).pop(); // dismiss dialog
          Navigator.push(
            this.context,
            MaterialPageRoute(builder: (context) => Message()),
          ).then((value) => this.chatScreenCallBack());
        } else {
          Navigator.push(
            this.context,
            MaterialPageRoute(builder: (context) => Message()),
          ).then((value) => this.chatScreenCallBack());
        }
      } else {}
    }
  }

  chatScreenCallBack() {
    isChatScreenOpen = false;
    this.getMessageList();
  }

  showAlertDialog(BuildContext context, String msg) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Chatfully"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  getMessageList() async {
    print("api call is being processed");
    setState(() {
      this.isLoading = true;
    });
    var jsonData;
    var request = await http
        .get("https://api.chatfully.io/mobile/v1/getchat?s=$userData");
    if (request.statusCode == 200) {
      jsonData = json.decode(request.body);
      if (jsonData["ok"] == true) {
        print(jsonData);
        setState(() {
          messageList = MessageListViewModel(jsonData);

          this.isLoading = false;
        });
        print("notification is ${currentNotiUser1}");
        if (isNotification) {
          if (currentNotiUser1 != "") {
            this.getChatMessage(currentNotiUser1);
          }
        }
      } else {
        setState(() {
          messageList = MessageListViewModel.from();
          this.isLoading = false;
        });
        // this.showAlertDialog(
        //     context, "Please subscribe a channel to see chats");
        this.showAlertDialog(context, "Please login to start!");
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    filterList2["Pending/Wait"] = "2";
    filterList2["Ignored"] = "3";
    filterList2["Closed"] = "4";
    filterList2["Do Not Call"] = "99";
    filterList2["All"] = "0";
    filterList2["Open"] = "1";
    filterList = filterList2.keys.toList();
    getUserData();
    getMessageList();
    WidgetsBinding.instance.addObserver(this);
    _notificationsStream = NotificationsBloc.instance.notificationsStream;
    _notificationsStream.listen((notification) {
      // TODO: Implement your logic here
      this.getMessageList();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    getMessageList();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xff242A32),
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: messageList.unreadMessage != 0
                ? CircleAvatar(
                    backgroundColor: Color(0xff90EE90),
                    radius: 15,
                    child: Text(
                      Uri.decodeFull(messageList.unreadMessage.toString())
                          .toString(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
          )
        ],
        centerTitle: true,
        title: Text(
          "Chatfully",
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: appColor,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.blockSizeVertical * 30,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                        radius: 40,
                        backgroundImage: currentUser.avatar != null
                            ? NetworkImage(Uri.decodeFull(currentUser.avatar))
                            : AssetImage('assets/logo.png')),
                    Text(
                      currentUser.nf != null
                          ? currentUser.nf + " " + currentUser.nl
                          : "",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Filters()),
                ).then((value) => this.getMessageList());
              },
              title: Text(
                "Filters",
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsScreen()),
                );
              },
              title: Text(
                "Notifications",
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 42,
            ),
            ListTile(
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.remove("s");
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
//                final action = Dialogs.yesAbort(context, "Logout", "are you sure");
              },
              title: Text(
                "Logout",
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Chats",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          this.isLoading = true;
                        });

                        setState(() {
                          this.isLoading = false;
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewMessage()),
                        );
                      },
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
                endIndent: 15,
                indent: 15,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: messageList.chats.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Chatin(messageList.chats[index], index, context,
                            (model, loading, id) {
                          message = model;
                          this.getChatMessage(id);
                        });
                      }))
            ],
          ),
          AnimatedContainer(
            height: this.isLoading ? MediaQuery.of(context).size.height : 0,
            duration: Duration(milliseconds: 100),
            color: Colors.black.withOpacity(0.2),
            child: SpinKitThreeBounce(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class Chatin extends StatelessWidget {
  MessageChatViewModel model;
  int index;
  BuildContext context;
  Chatin(this.model, this.index, this.context, this.isLoadingStart);
  final Function(MessageChatViewModel, bool, String) isLoadingStart;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.isLoadingStart(this.model, false, model.id);
      }
//        this.isLoadingStart(bool : true);
//        this.getChatMessage(model.g);
//      },
      ,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      model.n != null ? Uri.decodeFull(model.n).toString() : "",
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                  ),
                  Text(
                    "",
                    style: GoogleFonts.lato(color: Colors.white),
                  )
                ],
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      model.b != null ? Uri.decodeFull(model.b).toString() : "",
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 5.5,
                    decoration: BoxDecoration(
                        color: model.ur != 0
                            ? Color(0xff90EE90)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      model.ur == 0 ? "" : model.ur.toString(),
                      style: GoogleFonts.lato(color: Colors.white),
                    )),
                  )
                ],
              ),
            ),
            leading: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 26,
                  backgroundImage: model.p != null
                      ? NetworkImage(
                          "https://chatfully.io" + Uri.decodeFull(model.p),
                          scale: 3)
                      : AssetImage('assets/logo.png'),
                  onBackgroundImageError: (a, b) {
                    print(a.toString());
                  },
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 1,
            endIndent: 15,
            indent: 15,
          ),
        ],
      ),
    );
  }
}

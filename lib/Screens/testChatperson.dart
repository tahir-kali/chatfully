import 'dart:async';
import 'dart:convert';
import 'package:chatfully/Model/MessageViewModel.dart';
import 'package:chatfully/Model/NewMessageSearchModel.dart';
import 'package:chatfully/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Global.dart';
import '../colors.dart';

class TestChat extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<TestChat> {
  Radius radius = Radius.circular(10);
  var text;
  var error;
  var _controller = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  makenewChat() async {
    var contact = Provider.of<NewMessageSearchModel>(context, listen: false);
    var jsonData;
    var coc = contact.roc();
    var ctc = contact.rtc();
    Map<String, String> requestHeaders = {'s': "$userData"};
    var request = await http.get(
        "https://api.chatfully.io/mobile/v1/newchat?s=$userData&oc=$coc&tc=$ctc");
    if (request.statusCode == 200) {
      jsonData = json.decode(request.body);
      print(userData);
      if (jsonData["ok"] == true) {}
    }
  }

  getChatMessage(String messages, context) async {
    try {
      var contact = Provider.of<NewMessageSearchModel>(context, listen: false);
      var oc = contact.roc();
      var tc = contact.rtc();
      var jsonData;

      MessageViewModel gamer = MessageViewModel.from();
      gamer.s = currentUser.uid;
      gamer.b = messages;

      setState(() {
        currentMessages.messages.add(gamer);
      });
      _scrollController
          .jumpTo(_scrollController.position.maxScrollExtent + 100);
      var url =
          "https://api.chatfully.io/mobile/v1/send?s=$userData&oc=$oc&tc=$tc&b=$messages";

      var encoded = Uri.encodeFull(url);
      var decoded = Uri.decodeFull(encoded).toString();
      var request = await http.get(decoded);
      if (request.statusCode == 200) {
        jsonData = json.decode(request.body);

        if (jsonData["ok"] == true) {
          setState(() {
            this.error = 'Already sent the message';
          });
        }
      }
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  returnChild(MessageViewModel message) {
    print(message.s);
    print(message.b);
    print("current user is");
    print(currentUser.uid);

    if (message.s != null) {
      return Sender(
          message: message.b != null ? message.b : "", radius: radius);
    } else {
      return Reciever(
          message: message.b != null ? message.b : "", radius: radius);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    isChatScreenOpen = true;
    super.initState();
    makenewChat();

    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.jumpTo(1000000);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var contact = Provider.of<NewMessageSearchModel>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xffdee5e5),
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
          contact.rl() ?? "New Person",
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: appColor,
      ),
      body: Column(
        children: <Widget>[
          Text(error.toString()),
          Expanded(
            flex: 7,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    controller: _scrollController,
                    reverse: false,
                    shrinkWrap: false,
                    itemCount: currentMessages != null
                        ? currentMessages.messages.length
                        : 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child:
                            this.returnChild(currentMessages.messages[index]),
                      );
                    })),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5.0,
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            height: 50,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextField(
                                controller: this._controller,
                                onChanged: (String message) {
                                  this.text = message;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              this.getChatMessage(this.text, context);
                              this._controller.clear();
                            }),
                      ),
                    ],
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

class Reciever extends StatelessWidget {
  Reciever({this.message, this.radius});

  final message;
  final Radius radius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF81d8db),
                      borderRadius: BorderRadius.only(
                        topRight: radius,
                        topLeft: radius,
                        bottomLeft: radius,
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      message != null
                          ? Uri.decodeFull(message).toString()
                          : "No new message",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '17h',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

class Sender extends StatelessWidget {
  Sender({this.message, this.radius});
  final message;
  final Radius radius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 150,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFbbbbbb),
                      borderRadius: BorderRadius.only(
                        topRight: radius,
                        topLeft: radius,
                        bottomLeft: radius,
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                    child: Text(
                      message != null
                          ? Uri.decodeFull(message).toString()
                          : "No new received messages",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CircleAvatar(
                radius: 7,
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal * 1.5,
              ),
              Text(
                '17h',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

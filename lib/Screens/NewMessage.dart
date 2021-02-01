import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:chatfully/Model/ChatListViewModel.dart';
import 'package:chatfully/Model/ContactListViewModel.dart';
import 'package:chatfully/Model/ContactViewModel.dart';
import 'package:chatfully/Model/MessageChatViewModel.dart';
import 'package:chatfully/Model/NewMessageSearchModel.dart';
import 'package:chatfully/Screens/ChatPerson.dart';
import 'package:chatfully/Screens/testChatperson.dart';
import 'package:chatfully/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../colors.dart';
import 'package:chatfully/Global.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

_buildExpandableContent(contactList) {
  List<Widget> columnContent = [];
  messageList.chats.forEach((element) {
    columnContent.add(
      Card(
        child: ListTile(
          title: Text(
            element.n.toString(),
            style: new TextStyle(fontSize: 18.0),
          ),
          subtitle: Text(
            Uri.decodeFull(element.b.toString()),
            style: new TextStyle(fontSize: 18.0),
          ),
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: element.p != null
                ? NetworkImage("https:/chatfully.io" + element.p.toString())
                : AssetImage('assets/logo.png'),
          ),
        ),
      ),
    );
  });

  return columnContent;
}

class _NewMessageState extends State<NewMessage> {
  ContactListViewModel contactList = ContactListViewModel.from();
  Timer _debounce;
  String searchWord = "";
  bool chatexpanded = false;
  List<Widget> loading = [CircularProgressIndicator()];
  getChatList() async {
    setState(() {
      contactList = ContactListViewModel.from();
    });
    var jsonData;
    Map<String, String> requestHeaders = {'s': "$userData"};
    var request = await http.get(
        "https://api.chatfully.io/mobile/v1/search?s=$userData&q=$searchWord");
    if (request.statusCode == 200) {
      jsonData = json.decode(request.body);
      print(userData);
      if (jsonData["ok"] == true) {
        setState(() {
          contactList = ContactListViewModel(jsonData);
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    makenewChat(c) async {
      var jsonData;
      var coc = c.oc;
      var ctc = c.tc;
      Map<String, String> requestHeaders = {'s': "$userData"};

      var request = await http
          .get("https://api.chatfully.io/mobile/v1/newchat?s=&oc=$coc&tc=$ctc");
      if (request.statusCode == 200) {
        jsonData = json.decode(request.body);
        print(userData);
        if (jsonData["ok"] == true) {
          setState(() {});
        }
      }
    }

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
          "All People",
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: appColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: SizeConfig.blockSizeVertical * 7,
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 15,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 74,
                    height: 50,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (String word) {
                                this.searchWord = word;
                                if (_debounce?.isActive ?? false)
                                  _debounce.cancel();
                                _debounce = Timer(
                                    const Duration(milliseconds: 200), () {
                                  this.getChatList();
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.search),
                              onPressed: () {
                                this.getChatList();
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: ExpansionTile(
                backgroundColor:
                    chatexpanded != true ? Colors.white : Colors.teal,
                onExpansionChanged: (val) {
                  setState(() {
                    chatexpanded = val;
                  });
                },
                title: new Text(
                  'Chats',
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                children: <Widget>[
                  new Column(children: _buildExpandableContent(contactList)),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.4,
              child: contactList != null
                  ? ListView.builder(
                      itemCount: contactList.contacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SearchContainer(contactList.contacts[index]);
                      })
                  : Center(
                      child: Text('Search results will appear here.'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchContainer extends StatelessWidget {
  makenewChat(c, context) async {
    var nmsm = Provider.of<NewMessageSearchModel>(context, listen: false);
    var jsonData;
    var coc = c.oc;
    var ctc = c.tc;
    nmsm.updateContactListViewModel(c);
    Map<String, String> requestHeaders = {'s': "$userData"};

    var request = await http.get(
        "https://api.chatfully.io/mobile/v1/newchat?s=$userData&oc=$coc&tc=$ctc");
    if (request.statusCode == 200) {
      jsonData = json.decode(request.body);
      print(userData);
      if (jsonData["ok"] == true) {}
    }
  }

  final ContactViewModel c;
  SearchContainer(this.c);
  @override
  Widget build(BuildContext context) {
    var contact = Provider.of<NewMessageSearchModel>(context, listen: false);
    return ListTile(
      onTap: () {
        makenewChat(c, context);
        contact.updateContactListViewModel(c);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TestChat();
        }));
      },
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://i.pinimg.com/originals/7c/c7/a6/7cc7a630624d20f7797cb4c8e93c09c1.png"),
            radius: 22,
          ),
          Icon(
            FontAwesomeIcons.solidCircle,
            color: Colors.green,
            size: 15,
          ),
        ],
      ),
      title: Text(
        c.l != null ? c.l : "",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(c.l != null ? c.l : ""),
      trailing: Icon(
        FontAwesomeIcons.exclamationCircle,
        color: Colors.black,
      ),
    );
  }
}

class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);
}

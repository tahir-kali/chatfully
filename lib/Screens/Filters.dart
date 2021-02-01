import 'dart:convert';

import 'package:chatfully/Model/ChatListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Global.dart';
import '../colors.dart';
import '../size.dart';
import 'package:http/http.dart' as http;

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var isLoading = false;
  var dropDownValue = "";
  getChatList() async {
    setState(() {
      this.isLoading = true;
    });
    var jsonData;
    var request = await http
        .get("https://api.chatfully.io/mobile/v1/getinboxchan?s=$userData");
    if (request.statusCode == 200) {
      jsonData = json.decode(request.body);
      if (jsonData["ok"] == true) {
        setState(() {
          chatList = ChatListViewModel(jsonData);
          this.isLoading = false;
        });
      }
    }
  }

  setSubScribed(bool isSub, String id) async {
    setState(() {
      this.isLoading = true;
    });
    var jsonData;
    var url = "";
    if (isSub) {
      setState(() {
        url =
            "https://api.chatfully.io/mobile/v1/inboxsubscribe?s=$userData&ib=$id";
      });
    } else {
      setState(() {
        url =
            "https://api.chatfully.io/mobile/v1/inboxunsubscribe?s=$userData&ib=$id";
      });
    }
    var request = await http.get(url);
    if (request.statusCode == 200) {
      jsonData = json.decode(request.body);

      if (jsonData["ok"] == true) {
        if (isSub) {
          chatList.subscribed.add(id);
        } else {
          chatList.subscribed.removeWhere((element) => element == id);
        }
        setState(() {
          this.isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChatList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Color(0xffDDE5E5),
        appBar: AppBar(
          title: Text(
            "Filters",
            style: GoogleFonts.lato(color: Colors.white),
          ),
          backgroundColor: appColor,
        ),
        body: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Chat Status (Disposition)",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: dropItem(),
                          onChanged: (v) {
                            print(currentFilter);
                            setState(() {
                              currentFilter = v;
                            });
                            // setState(() {
                            // });
                          },
                          hint: Text("Select a filter"),
                          isDense: true,
                          isExpanded: true,
                          value: currentFilter != "" ? currentFilter : null,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Team Inboxes",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: chatList.inboxList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (chatList.subscribed
                                .contains(chatList.inboxList[index].id)) {
                              setSubScribed(
                                  false, chatList.inboxList[index].id);
                            } else {
                              setSubScribed(true, chatList.inboxList[index].id);
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: chatList.subscribed
                                        .contains(chatList.inboxList[index].id)
                                    ? Color(0xff676767)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  chatList.inboxList[index].n != null
                                      ? chatList.inboxList[index].n
                                      : "",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2,
                                      color: chatList.subscribed.contains(
                                              chatList.inboxList[index].id)
                                          ? Colors.white
                                          : Color(0xff676767)),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
            AnimatedContainer(
              height: this.isLoading ? MediaQuery.of(context).size.height : 0,
              duration: Duration(milliseconds: 000),
              color: Colors.black.withOpacity(0.2),
              child: SpinKitThreeBounce(
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}

List<DropdownMenuItem<String>> dropItem() {
  return filterList
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ))
      .toList();
}

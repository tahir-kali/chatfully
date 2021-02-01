import 'dart:developer';

import 'package:chatfully/Model/SubUserViewModel.dart';
class UserViewModel {
  String nf,nl,uid,uos,ib,ibs,avatar30,avatar;
  List r = new List();
  SubUserViewModel subUserViewModel = SubUserViewModel.from();
  UserViewModel.name();
   UserViewModel(Map<String,dynamic> json){
    this.nf = json["nf"] as String;
    this.nl = json["nl"] as String;
    this.uid = json["uid"] as String;
    this.uos = json["uos"] as String;
    this.ib = json["ib"] as String;
    this.ibs = json["ibs"] as String;
    this.avatar30 = json["avatar30"] as String;
    this.avatar = json["avatar"] as String;
    r = json["r"];
    subUserViewModel = SubUserViewModel(json["pl"]);
    print(json);
   }
}
import 'package:chatfully/Model/ContactListViewModel.dart';
import 'package:chatfully/Model/ContactViewModel.dart';
import 'package:flutter/cupertino.dart';

class NewMessageSearchModel extends ChangeNotifier {
  ContactViewModel contact;
  String oc;
  String tc;
  String l;
  String n;
  String d;

  updateContactListViewModel(model) {
    this.oc = model.oc;
    this.tc = model.tc;
    this.l = model.l;
    this.n = model.n;
    this.d = model.d;
    notifyListeners();
  }

  roc() => oc;
  rtc() => tc;
  rl() => l;
  rn() => n;
  rd() => d;
}

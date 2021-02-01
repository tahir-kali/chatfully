class ContactViewModel {
  String n,tc,oc,i,d,l;
  int c;
  ContactViewModel.from();
  ContactViewModel(Map<String,dynamic> json){
    n = json["n"] as String;
    c = json["c"] as int;
    tc = json["tc"] as String;
    oc = json["oc"] as String;
    i = json["i"] as String;
    d = json["d"] as String;
    l = json["l"] as String;
  }
}
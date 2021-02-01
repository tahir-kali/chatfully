class MessageViewModel {
  String c,mi,b,s,id;
  int d;
  MessageViewModel.from();
  MessageViewModel(Map<String,dynamic> json){
    this.c = json["c"] as String;
    this.d = json["d"] as int;
    this.mi = json["mi"] as String;
    this.id = json["id"] as String;
    this.s = json["s"] as String;
    this.b = json["b"] as String;

  }
}
class MessageChatViewModel {
  String b, n, g, tc, oc, c, x, id, p, l, ds;
  int d;
  int ur = 0;
  MessageChatViewModel.from();
  MessageChatViewModel(Map<String, dynamic> json) {
    this.b = json["b"] as String;
    if (json["n"] != null) {
      this.n = json["n"] as String;
    }
    this.d = json["d"] as int;
    if (json["ur"] != null) {
      this.ur = json["ur"] as int;
    }
    this.g = json["g"] as String;
    this.tc = json["tc"] as String;
    this.oc = json["oc"] as String;
    this.c = json["c"] as String;
    this.x = json["x"] as String;
    this.id = json["id"] as String;
    this.p = json["p"] as String;
    this.ds = json["ds"].toString();
    this.l = json["l"] as String;
  }
}

class ChatViewModel {
  String c,oc,n,id,ni,inn;
  bool isnew;
  ChatViewModel.from();
  ChatViewModel(Map<String,dynamic> json){
    this.c = json["c"] as String;
    this.oc = json["oc"] as String;
    this.n = json["n"] as String;
    this.id = json["id"] as String;
    this.ni = json["in"] as String;
    this.inn = json["inn"] as String;
    this.isnew = json["new"] as bool;
    print(id);
  }
}
class InboxListViewModel {
  String n,id;
  InboxListViewModel.from();
  InboxListViewModel(Map<String,dynamic> json) {
    this.n = json["n"] as String;
    this.id = json["id"] as String;
  }
}
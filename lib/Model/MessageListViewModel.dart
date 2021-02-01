import 'package:chatfully/Global.dart';
import 'package:chatfully/Model/MessageChatViewModel.dart';

class MessageListViewModel {
  List<dynamic> chats = List();
  List<String> ibIds = List();
  MessageListViewModel.from();
  var unreadMessage = 0;
  MessageListViewModel(Map<String, dynamic> json) {
    //This is what I changed :) - Tahir Rahimi
    var c = json["chat"];
    var ib = json["ib"];
    //print("\n\n\n\n\n\n\n" + c);
    for (var i = 0; i < ib.length; i++) {
      ibIds.add(ib[i] as String);
      // print("\n\n\n\n\n\n\n" + ib[i]);
    }
    for (var i = 0; i < c.length; i++) {
      var chat = MessageChatViewModel(c[i] as Map<String, dynamic>);
      this.unreadMessage += chat.ur;
      if (currentFilter == "" || filterList2[currentFilter] == "0") {
        chats.add(chat);
      } else {
        if (chat.ds == filterList2[currentFilter]) {
          chats.add(chat);
        }
      }
      chats.sort((a, b) => b.d.compareTo(a.d));
    }
  }
}

import 'package:chatfully/Model/ChatViewModel.dart';
import 'package:chatfully/Model/InboxListViewModel.dart';

class ChatListViewModel {
  List<InboxListViewModel> inboxList = List();
  List<ChatViewModel> chatList = List();
  ChatListViewModel.from();
  List<String> subscribed = List();
  ChatListViewModel(Map<String,dynamic> json){
    List list = json["inbox"] as List;
    for (var i=0; i<list.length; i++) {
      inboxList.add(InboxListViewModel(list[i] as Map<String,dynamic>));
    }
    List chats = json["chan"] as List;
    for (var i = 0; i< chats.length; i ++) {
      this.chatList.add(ChatViewModel(chats[i] as Map<String,dynamic>));
    }
    List sub = json["inboxSbuscribed"] as List;
    for (var i = 0; i< sub.length;i++) {
      this.subscribed.add(sub[i] as String);
      print(sub[i]);
    }
  }
}
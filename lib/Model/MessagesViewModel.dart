import 'package:chatfully/Global.dart';
import 'package:chatfully/Model/MessageViewModel.dart';

class MessagesViewModel {
  List<MessageViewModel> messages = List();
  MessagesViewModel.from();
  MessagesViewModel(Map<String, dynamic> json) {
    List ib = json["messages"] as List;
    for (int i = 0; i < ib.length; i++) {
      this.messages.add(MessageViewModel(ib[i] as Map<String, dynamic>));
    }
  }
}

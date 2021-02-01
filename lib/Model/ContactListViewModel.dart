import 'package:chatfully/Model/ContactViewModel.dart';

class ContactListViewModel {
  List<ContactViewModel> contacts = List();
  ContactListViewModel.from();
  ContactListViewModel(Map<String,dynamic> json){
    List c = json["contacts"] as List;
    print(c);
    for (var i =0;i< c.length;i++) {
      contacts.add(ContactViewModel(c[i] as Map<String,dynamic>));
    }
  }
}
import 'package:chat_application/Screens/personChatView.dart';
import 'package:chat_application/utils/toast.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';

import 'models/userModel.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key key}) : super(key: key);

  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  Map<String, Color> contactsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getPermissions();
  }

  getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      getAllContacts();
      searchController.addListener(() {
        filterContacts();
      });
    }
  }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  getAllContacts() async {
    List colors = [Colors.green, Colors.indigo, Colors.yellow, Colors.orange];
    int colorIndex = 0;
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    _contacts.forEach((contact) {
      Color baseColor = colors[colorIndex];
      contactsColorMap[contact.displayName] = baseColor;
      colorIndex++;
      if (colorIndex == colors.length) {
        colorIndex = 0;
      }
    });
    setState(() {
      contacts = _contacts;
    });
  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        String contactName = contact.displayName.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }

        if (searchTermFlatten.isEmpty) {
          return false;
        }

        var phone = contact.phones.firstWhere((phn) {
          String phnFlattened = flattenPhoneNumber(phn.value);
          return phnFlattened.contains(searchTermFlatten);
        }, orElse: () => null);

        return phone != null;
      });
    }
    setState(() {
      contactsFiltered = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: isSearching == true
                    ? contactsFiltered.length
                    : contacts.length,
                itemBuilder: (context, index) {
                  Contact contact = isSearching == true
                      ? contactsFiltered[index]
                      : contacts[index];

                  var baseColor =
                      contactsColorMap[contact.displayName] as dynamic;

                  Color color1 = baseColor[800];
                  Color color2 = baseColor[400];
                  return GestureDetector(
                    onTap: () {
                      if (contact.displayName != null) {
                        var x = contact.phones.elementAt(0).value;
                        String z = x.replaceAll(" ", "");
                        print(z.trim());

                        User obj = User(
                            Name: contact.displayName,
                            Phone: z.trim(),
                            photo: contact.avatar);
                        List list = [];

                        if (Hive.box("chat").containsKey(obj.Phone)) {
                          list = Hive.box("chat").get(obj.Phone);
                          print(list);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonChatView(
                                      user1: obj,
                                      msgList: list,
                                    )));
                      }
                    },
                    child: ListTile(
                        title: Text(contact.displayName != null
                            ? contact.displayName
                            : ""),
                        subtitle: Text(contact.phones.length > 0
                            ? contact.phones.elementAt(0).value
                            : ''),
                        leading: (contact.avatar != null &&
                                contact.avatar.length > 0)
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(contact.avatar),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        colors: [
                                          color1,
                                          color2,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                                child: CircleAvatar(
                                    child: Text(contact.initials(),
                                        style: TextStyle(color: Colors.white)),
                                    backgroundColor: Colors.transparent))),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

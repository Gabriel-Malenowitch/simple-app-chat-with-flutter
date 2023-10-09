import 'package:flutter/material.dart';
import 'package:simple_app_chat/fake_data.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  ChatsState createState() => ChatsState();
}

class ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    final names = FakeData().generateNames();
    handleChatRedirect(String name) =>
        Navigator.pushNamed(context, '/chat', arguments: {'name': name});

    return Scaffold(
        appBar: AppBar(
          title: const Text("Uati Zap 2"),
        ),
        body: ListView(
          children: names
              .map((user) => GestureDetector(
                    onTap: () => handleChatRedirect(user['name']),
                    child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(children: [
                            const CircleAvatar(
                                radius: 24,
                                backgroundImage: NetworkImage(
                                    'https://avatars.githubusercontent.com/u/56513919?v=4')),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultTextStyle(
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black),
                                    child: Text(
                                      user["name"] ?? '',
                                    )),
                                const DefaultTextStyle(
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                  child: Text("Quero caféééé!!!"),
                                ),
                              ],
                            ),
                          ])),
                    ),
                  ))
              .toList(),
        ));
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_app_chat/pages/message_widget.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  String messageValue = '';
  List<Map<String, dynamic>> messages = [
    {'text': 'Oii', 'side': Side.end},
    {'text': 'Fala', 'side': Side.start},
    {'text': 'Safe?', 'side': Side.end},
    {'text': 'Belezinha', 'side': Side.start},
    {'text': 'Foi no mercado né?', 'side': Side.end},
    {'text': 'Compra paçoca pra mim?', 'side': Side.end},
    {'text': 'Te faço o pix', 'side': Side.end},
    {'text': 'Blz', 'side': Side.start},
    {'text': 'Teste 1', 'side': Side.start},
    {'text': 'Teste 2', 'side': Side.end},
    {'text': 'Teste 3', 'side': Side.start},
    {'text': 'Teste 4', 'side': Side.end},
    {'text': 'Teste 5', 'side': Side.start},
    {'text': 'Teste 5', 'side': Side.end},
  ];
  final ScrollController listController = ScrollController();
  final TextEditingController textFieldController = TextEditingController();

  void scrollDown() {
    listController.animateTo(listController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  handleSubmit() {
    setState(() {
      messages.add({
        'text': messageValue,
        'side': Random().nextInt(10) % 2 == 1 ? Side.start : Side.end
      });
      scrollDown();
      textFieldController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        appBar: AppBar(title: Text(args['name'] ?? '')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: height - appBarHeight - 80,
                    child: FutureBuilder(
                      future: Future.delayed(
                          const Duration(milliseconds: 100), () => true),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          scrollDown();
                        }
                        return ListView(
                          controller: listController,
                          children: messages
                              .map((Map<String, dynamic> message) =>
                                  MessageWidget(
                                    side: message['side'],
                                    message: message['text'],
                                  ))
                              .toList(),
                        );
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: (width / 3) * 2.5 - 40,
                      child: TextField(
                        controller: textFieldController,
                        onChanged: (value) => messageValue = value,
                        decoration: const InputDecoration(hintText: "Mensagem"),
                      ),
                    ),
                    FilledButton(
                        onPressed: handleSubmit,
                        child: const SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.send),
                        ))
                  ],
                ),
              ]),
        ));
  }
}

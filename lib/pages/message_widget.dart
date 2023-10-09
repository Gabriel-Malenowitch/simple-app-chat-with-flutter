import 'package:flutter/material.dart';

enum Side { start, end }

class MessageWidget extends StatefulWidget {
  const MessageWidget({super.key, required this.message, required this.side});
  final Side side;
  final String message;

  @override
  State<MessageWidget> createState() => MessageWidgetState();
}

class MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: widget.side == Side.start
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Card(
              color: widget.side == Side.start ? Colors.green.shade100 : null,
              child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(widget.message)))),
        ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_frontend/screens/directMessage/chat_menu_item.dart';
import 'package:popover/popover.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isCurrentUser ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: InkWell(
          onTap: () => showPopover(
              context: context,
              bodyBuilder: (context) => const MenuIcons(),
              height: 180,
              direction: isCurrentUser
                  ? PopoverDirection.left
                  : PopoverDirection.right),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}

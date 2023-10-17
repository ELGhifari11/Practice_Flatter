import 'package:flutter/material.dart';

class ChatItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  ChatItems(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      title: Text(title),
      titleTextStyle: TextStyle(
        color: const Color.fromARGB(255, 7, 5, 0),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      dense: true,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: const Text('10:00 PM'),
      tileColor: Colors.white10,
    );
  }
}

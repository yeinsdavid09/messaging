import 'package:flutter/material.dart';
import 'package:messaging/widgets/chat/her_bubble_message.dart';

//* Widgets
import 'package:messaging/widgets/chat/my_bubble_message.dart';

class ChatScreen extends StatelessWidget {
  //#region --------------------------------- Hooks ---------------------------------

  const ChatScreen({super.key});

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/564x/c5/43/cd/c543cd798d203442a63ee559dd3e0d7f.jpg',
            ),
          ),
        ),
        title: const Text('Lionel Messi ⚽'),
        centerTitle: false,
      ),
      body: const SafeArea(child: _ChatView()),
    );
  }

  //#endregion
}

class _ChatView extends StatelessWidget {
  //#region --------------------------------- Hooks ---------------------------------

  const _ChatView();

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerBubbleMessage()
                    : const MyBubbleMessage();
              },
            ),
          ),
          const Text('Hola'),
        ],
      ),
    );
  }

  //#endregion
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//* Entities
import 'package:messaging/domain/entities/message.dart';

//* Providers
import 'package:messaging/providers/chat_provider.dart';

//* Widgets
import 'package:messaging/widgets/chat/my_bubble_message.dart';
import 'package:messaging/widgets/chat/her_bubble_message.dart';
import 'package:messaging/widgets/shared/message_field_box.dart';

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
    //#region ----------------------------------- Variables ---------------------------------

    final chatProvider = context.watch<ChatProvider>();

    //#endregion

    //#region --------------------------------- Return ---------------------------------

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.owner == Owner.notMine)
                    ? HerBubbleMessage(message: message)
                    : MyBubbleMessage(message: message);
              },
            ),
          ),
          MessageFieldBox(
            onEmitValue: (value) {
              chatProvider.sendMessage(Message(text: value, owner: Owner.mine));
            },
          ),
        ],
      ),
    );

    //#endregion
  }

  //#endregion
}

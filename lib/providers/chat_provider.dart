import 'package:flutter/material.dart';

//* Entities
import 'package:messaging/domain/entities/message.dart';

//* Services
import 'package:messaging/services/yes_no_anwer/yes_no_answer_service.dart';

class ChatProvider extends ChangeNotifier {
  //#region ----------------------------------- Variables ---------------------------------

  List<Message> messageList = [];
  final chatScrollController = ScrollController();
  final yesNoAnswerService = YesNoAnswerService();

  //#endregion

  //#region --------------------------------- Hooks ---------------------------------

  Future<void> sendMessage(Message message) async {
    if (message.text.isEmpty) return;
    if (message.text.endsWith('?')) getAnswer();
    messageList.add(message);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> getAnswer() async {
    final response = await yesNoAnswerService.getAnswer();
    print('Here => ${response.text}');
    messageList.add(response);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
    );
  }

  //#endregion
}

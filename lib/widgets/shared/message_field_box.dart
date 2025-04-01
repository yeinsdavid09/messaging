import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  //#region ----------------------------------- Variables ---------------------------------

  final ValueChanged<String> onEmitValue;

  //#endregion

  //#region --------------------------------- Hooks ---------------------------------

  const MessageFieldBox({super.key, required this.onEmitValue});

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  @override
  Widget build(BuildContext context) {
    //#region ----------------------------------- Variables ---------------------------------

    final colors = Theme.of(context).colorScheme;
    final border = UnderlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(40),
    );
    final messageController = TextEditingController();
    final messageFocusNode = FocusNode();

    //#endregion

    //#region --------------------------------- Return ---------------------------------

    return TextFormField(
      controller: messageController,
      onFieldSubmitted: (value) {
        onEmitValue(value);
        messageController.clear();
        messageFocusNode.requestFocus();
      },
      onTapOutside: (event) {
        messageFocusNode.unfocus();
      },
      focusNode: messageFocusNode,
      decoration: InputDecoration(
        hintText: 'End your message with a "?"',
        filled: true,
        enabledBorder: border,
        focusedBorder: border,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            onEmitValue(messageController.value.text);
            messageController.clear();
            messageFocusNode.requestFocus();
          },
        ),
      ),
    );

    //#endregion
  }

  //#endregion
}

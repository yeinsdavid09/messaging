import 'package:flutter/material.dart';

//* Entities
import 'package:messaging/domain/entities/message.dart';

class MyBubbleMessage extends StatelessWidget {
  //#region ----------------------------------- Variables ---------------------------------

  final Message message;

  //#endregion

  //#region --------------------------------- Hooks ---------------------------------

  const MyBubbleMessage({super.key, required this.message});

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  @override
  Widget build(BuildContext context) {
    //#region ----------------------------------- Variables ---------------------------------

    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    //#endregion

    //#region --------------------------------- Return ---------------------------------

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: size.width * 0.8),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );

    //#endregion
  }

  //#endregion
}

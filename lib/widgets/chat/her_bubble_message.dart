import 'package:flutter/material.dart';

//* Entities
import 'package:messaging/domain/entities/message.dart';

class HerBubbleMessage extends StatelessWidget {
  //#region ----------------------------------- Variables ---------------------------------

  final Message message;

  //#endregion

  //#region --------------------------------- Hooks ---------------------------------

  const HerBubbleMessage({super.key, required this.message});

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    //#region ----------------------------------- Variables ---------------------------------

    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    //#endregion

    //#region --------------------------------- Return ---------------------------------

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: size.width * 0.8),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              capitalize(message.text),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageMessage(image: message.image!),
        const SizedBox(height: 10),
      ],
    );

    //#endregion
  }

  //#endregion
}

class _ImageMessage extends StatelessWidget {
  //#region ----------------------------------- Variables ---------------------------------

  final String image;

  //#endregion

  //#region --------------------------------- Hooks ---------------------------------

  const _ImageMessage({required this.image});

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  @override
  Widget build(BuildContext context) {
    //#region ----------------------------------- Variables ---------------------------------

    final size = MediaQuery.of(context).size;

    //#endregion

    //#region --------------------------------- Return ---------------------------------

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        image,
        width: size.width * 0.8,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return SizedBox(
            width: size.width * 0.8,
            height: 150,
            child: const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );

    //#endregion
  }

  //#endregion
}

import 'package:flutter/material.dart';

class HerBubbleMessage extends StatelessWidget {
  //#region --------------------------------- Hooks ---------------------------------

  const HerBubbleMessage({super.key});

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: size.width * 0.8),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Voluptate cillum aliqua excepteur laborum. Ad ullamco magna consequat magna ut exercitation qui laborum.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        const _ImageMessage(),
        const SizedBox(height: 10),
      ],
    );
  }

  //#endregion
}

class _ImageMessage extends StatelessWidget {
  //#region --------------------------------- Hooks ---------------------------------

  const _ImageMessage();

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/yes/5-64c2804cc48057b94fd0b3eaf323d92c.gif',
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
  }

  //#endregion
}

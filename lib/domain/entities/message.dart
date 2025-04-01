enum Owner { mine, notMine }

class Message {
  //#region ----------------------------------- Variables ---------------------------------

  final String text;
  final Owner owner;
  final String? image;

  //#endregion

  //#region --------------------------------- Hooks ---------------------------------

  Message({required this.text, required this.owner, this.image});

  //#endregion
}

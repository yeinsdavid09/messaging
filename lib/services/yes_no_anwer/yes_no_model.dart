class YesNoAnswerModel {
  //#region ----------------------------------- Variables ---------------------------------

  String answer;
  bool forced;
  String image;

  //#endregion

  //#region --------------------------------- Hooks ---------------------------------

  YesNoAnswerModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  factory YesNoAnswerModel.fromJson(Map<String, dynamic> json) {
    return YesNoAnswerModel(
      answer: json['answer'],
      forced: json['forced'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'answer': answer,
    'forced': forced,
    'image': image,
  };

  //#endregion
}

import 'package:dio/dio.dart';

//* Entities
import 'package:messaging/domain/entities/message.dart';

//* Models
import 'package:messaging/services/yes_no_anwer/yes_no_model.dart';

class YesNoAnswerService {
  //#region ----------------------------------- Variables ---------------------------------

  final _dio = Dio();
  final _api = 'https://yesno.wtf/api';

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  Future<Message> getAnswer() async {
    final response = await _dio.get(_api);
    final data = YesNoAnswerModel.fromJson(response.data);
    return Message(text: data.answer, owner: Owner.notMine, image: data.image);
  }

  //#endregion
}

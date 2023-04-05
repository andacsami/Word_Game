import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kelime_oyunu/models/question_model.dart';

class ApiService {
  RegExp deleteBracekts = RegExp(r"([\[\]])");
  Future<Question?> getQuestion(
      {String soruNumber = "1", String tur = "kolay"}) async {
    late Response<String> response;
    late String string;
    try {
      response = await Dio().get(
          'http://emeltek.com/stajerOyun/samiandac/kelimegetir.php?soruid=$soruNumber&tur=$tur');
      string = response.data!.replaceAll(deleteBracekts, "");
      var i = string.lastIndexOf(",");
      string = string.substring(0, i) + string.substring(i + 1);
      print(jsonDecode(string));
      var question = Question.fromJson(jsonDecode(string));

      return question;
    } catch (e) {
      return null;
    }
  }
}

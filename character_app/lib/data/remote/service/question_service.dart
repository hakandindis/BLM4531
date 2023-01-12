// ignore_for_file: avoid_print, non_constant_identifier_names, unused_field

import 'package:character_app/data/remote/model/question.dart';
import 'package:dio/dio.dart';

class QuestionService {
  final String _BASE_URL = "https://hakandindis.github.io/";
  final String _QUESTIONS = "character/questions.json";
  final String _CATEGORY = "character/category.json";

  final Dio dio = Dio();

  static QuestionService service = QuestionService._();

  QuestionService._();

  Future<List<Question>?> fetchAllQuestions(String category) async {
    String url = "$_BASE_URL$_QUESTIONS";

    try {
      Response response = await dio.get(url).timeout(const Duration(seconds: 3));
      List<Question> questions = (response.data as List).map((e) => Question.fromJson(e)).toList();
      questions.removeWhere((element) => element.category != category);
      for (int i = 0; i < questions.length; i++) {
        print(questions[i].toString());
      }
      print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
      return questions;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}

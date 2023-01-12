import 'package:equatable/equatable.dart';

class Question extends Equatable {
  late int id;
  late String category;
  late String question;
  late String answer;
  late String userAnswer;
  late List<String> options;

  Question({
    required this.id,
    required this.category,
    required this.question,
    required this.answer,
    required this.userAnswer,
    required this.options,
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    question = json['question'];
    answer = json['answer'];
    userAnswer = json['user_answer'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['category'] = category;
    data['question'] = question;
    data['answer'] = answer;
    data['user_answer'] = userAnswer;
    data['options'] = options;
    return data;
  }

  @override
  List<Object?> get props => [id, category, question, answer, userAnswer, options];
}

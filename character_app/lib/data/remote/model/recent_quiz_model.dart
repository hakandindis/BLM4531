import 'package:flutter/cupertino.dart';

class RecentQuizModel {
  final int totalQuestions;
  final int answeredQuestions;
  final String name;
  final IconData icon;

  RecentQuizModel({
    required this.totalQuestions,
    required this.answeredQuestions,
    required this.name,
    required this.icon,
  });
}

List<RecentQuizModel> recentQuizzes = [
  RecentQuizModel(
    name: "General Knowledge",
    icon: CupertinoIcons.globe,
    totalQuestions: 10,
    answeredQuestions: 10,
  ),
  RecentQuizModel(
    name: "Sports",
    icon: CupertinoIcons.sportscourt,
    totalQuestions: 10,
    answeredQuestions: 10,
  ),
  RecentQuizModel(
    name: "Science",
    icon: CupertinoIcons.flame,
    totalQuestions: 10,
    answeredQuestions: 10,
  ),
  RecentQuizModel(
    name: "History",
    icon: CupertinoIcons.clock,
    totalQuestions: 10,
    answeredQuestions: 10,
  ),
  RecentQuizModel(
    name: "Geography",
    icon: CupertinoIcons.location,
    totalQuestions: 10,
    answeredQuestions: 10,
  ),
];

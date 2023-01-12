import 'package:flutter/cupertino.dart';

class LiveQuizModel {
  final String name;
  final IconData icon;
  final int activePlayers;

  LiveQuizModel({
    required this.name,
    required this.icon,
    required this.activePlayers,
  });
}

List<LiveQuizModel> liveQuizzes = [
  LiveQuizModel(
    name: "English for work",
    icon: CupertinoIcons.book,
    activePlayers: 1295,
  ),
  LiveQuizModel(
    name: "Vehicles",
    icon: CupertinoIcons.car,
    activePlayers: 100,
  ),
];

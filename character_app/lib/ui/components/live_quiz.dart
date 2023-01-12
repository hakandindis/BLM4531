import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../data/remote/model/live_quiz_model.dart';

class LiveQuiz extends StatelessWidget {
  const LiveQuiz({super.key, required this.liveQuizModel});
  final LiveQuizModel liveQuizModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black26,
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.all(15),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            liveQuizModel.icon,
            color: Colors.white,
          ),
        ),
        title: Text(liveQuizModel.name),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Ionicons.document_text_outline,
              size: 18,
            ),
            SizedBox(width: 5),
            Text("10/10 Questions"),
          ],
        ),
      ),
    );
  }
}

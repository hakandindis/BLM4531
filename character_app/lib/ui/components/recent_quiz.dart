import 'package:character_app/data/remote/model/recent_quiz_model.dart';
import 'package:character_app/ui/question/question_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RecentQuiz extends StatelessWidget {
  const RecentQuiz({super.key, required this.recentQuizModel});
  final RecentQuizModel recentQuizModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black26,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionPage(
                      title: recentQuizModel.name,
                      categoryName: "Film",
                    )),
          );
        },
        contentPadding: const EdgeInsets.all(15),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            recentQuizModel.icon,
            color: Colors.white,
          ),
        ),
        title: Text(recentQuizModel.name),
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

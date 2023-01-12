import 'package:character_app/constants/static_answers.dart';
import 'package:character_app/data/remote/model/question.dart';
import 'package:character_app/data/remote/service/question_service.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../character/character_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.title, required this.categoryName});
  final String title;
  final String categoryName;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int currentQuestion = 0;
  final PageController _pageController = PageController();

  late List<Question> questions = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline_sharp),
          ),
        ],
      ),
      body: FutureBuilder(
        future: QuestionService.service.fetchAllQuestions(widget.categoryName),
        builder: (context, snapshot) {
          if (questions != []) {
            questions = snapshot.data ?? [];
          }
          return Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Question ${currentQuestion + 1}/${questions.length}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentQuestion = value;
                      });
                    },
                    itemCount: questions.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final question = questions[index];

                      return ListView(
                        children: [
                          Text(
                            question.question,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 25),
                          ...List.generate(
                            4,
                            (optionIndex) {
                              final option = question.options[optionIndex];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: RadioListTile(
                                  tileColor: Colors.grey[200],
                                  contentPadding: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  value: option,
                                  groupValue: question.userAnswer,
                                  selected: ANSWERS[index] == option,
                                  selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
                                  onChanged: (value) {
                                    setState(() {
                                      ANSWERS[index] = value!;
                                    });
                                  },
                                  title: Text(option),
                                  activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: questions.length - 1 == currentQuestion,
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CharacterPage(
                                category: widget.categoryName,
                              ),
                            ));
                      },
                      child: Text("Submit"),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

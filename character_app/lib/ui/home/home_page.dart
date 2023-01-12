import 'package:character_app/ui/components/category_tile.dart';
import 'package:character_app/ui/components/quiz_header.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categoryNames = ["film", "dizi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: buildBottomNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            const QuizHeader(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 25, left: 15, bottom: 15, right: 15),
                children: [
                  Text(
                    "Recent Quiz",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 15),
                  ...List.generate(
                    categoryNames.length,
                    (index) {
                      return CategoryTile(categoryName: categoryNames[index], icon: Icons.movie);
                    },
                  ),
                  const SizedBox(height: 15),
                  // Text(
                  //   "Live Quiz",
                  //   style: Theme.of(context).textTheme.headline6,
                  // ),
                  // const SizedBox(height: 15),
                  // ...List.generate(
                  //   liveQuizzes.length,
                  //   (index) {
                  //     return LiveQuiz(
                  //       liveQuizModel: liveQuizzes[index],
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Ionicons.home_outline), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Ionicons.ribbon_outline), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Ionicons.chatbox_ellipses_outline), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Ionicons.person_outline), label: "Home"),
      ],
    );
  }
}

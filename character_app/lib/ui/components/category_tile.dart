import 'package:flutter/material.dart';

import '../question/question_page.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.categoryName, required this.icon});
  final String categoryName;
  final IconData icon;

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
                title: "Filmler",
                categoryName: categoryName,
              ),
            ),
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
          // ignore: prefer_const_constructors
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(categoryName.toUpperCase()),
      ),
    );
  }
}

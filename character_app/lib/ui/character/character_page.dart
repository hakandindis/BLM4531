import 'package:flutter/material.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key, required this.category});
  final String category;
  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late final String src;
  @override
  Widget build(BuildContext context) {
    src = widget.category == "film" ? "assets/vader.png" : "assets/wick.jpg";
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("YOUR CHARACTER")),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(child: Image.asset(src)),
      ),
    );
  }
}

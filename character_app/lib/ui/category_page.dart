import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Card(
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

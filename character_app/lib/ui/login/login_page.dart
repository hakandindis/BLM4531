// ignore_for_file: prefer_const_constructors

import 'package:character_app/ui/components/my_button.dart';
import 'package:character_app/ui/components/my_text_field.dart';
import 'package:character_app/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Image.network(
                    "https://avatars.githubusercontent.com/u/76224983?s=400&u=ffe94d9b42cce2c5bc919006485f639f19389a84&v=4",
                    height: 300,
                    width: 300),
                SizedBox(height: 50),
                Text("WELCOME TO QUIZ APP", style: TextStyle(color: Colors.grey[700], fontSize: 16)),
                SizedBox(height: 25),
                MyTextField(controller: userNameController, hintText: "User name", obscureText: false),
                SizedBox(height: 10),
                MyTextField(controller: passwordController, hintText: "Password", obscureText: true),
                SizedBox(height: 50),
                MyButton(onTap: () {
                  signUserIn(context);
                }),
                SizedBox(height: 50),
                Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

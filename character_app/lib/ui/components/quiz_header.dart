import 'package:flutter/material.dart';

class QuizHeader extends StatelessWidget {
  const QuizHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/quiz_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "Let's Play",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "And be the first!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  child: Text(
                    "LS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 140,
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black38,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter your quiz code",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 5),
                        const Text("To play with your friends"),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Enter Code",
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Join"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

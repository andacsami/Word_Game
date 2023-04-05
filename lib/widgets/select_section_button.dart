import 'package:flutter/material.dart';
import 'package:kelime_oyunu/screens/question_page.dart';

class ButtonWidget extends StatelessWidget {
  final String content;
  const ButtonWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
      child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(50, 70)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 28, 108, 173)),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionPage(soruTuru: content),
                ));
          },
          child: Text(
            content,
            style: const TextStyle(fontSize: 24),
          )),
    );
  }
}

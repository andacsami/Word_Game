import 'package:flutter/material.dart';
import '../widgets/select_section_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kelime Oyunu"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Sorular",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: Colors.blue[900],
            ),
          ),
          const ButtonWidget(content: "Kolay"),
          const ButtonWidget(content: "Orta"),
          const ButtonWidget(content: "Zor"),
        ],
      ),
    );
  }
}

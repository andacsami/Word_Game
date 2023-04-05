import 'package:flutter/material.dart';
import 'package:kelime_oyunu/models/question_model.dart';
import 'package:kelime_oyunu/screens/win_page.dart';
import '../services/api_service.dart';
import '../widgets/latters_buton_widget.dart';
import '../widgets/latters_target_button_widget.dart';

class QuestionPage extends StatefulWidget {
  final String soruTuru;
  QuestionPage({Key? key, required this.soruTuru}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
  late Future<Question?> questionData;

  var isCompleted = false;
  var isFilled = false;
  var answerList = [];
  ApiService apiService = ApiService();
}

class _QuestionPageState extends State<QuestionPage> {
  int soruNumber = 1;

  @override
  void initState() {
    super.initState();
    widget.questionData = getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var cevap = (snapshot.data as Question).cevap!;
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  (snapshot.data as Question).soru!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 150,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        widget.answerList.clear();
                        for (var latter in cevap.split("")) {
                          widget.answerList.add(false);
                        }
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.replay,
                        color: Color.fromARGB(255, 7, 40, 89),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: buildLatterTarget(cevap),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: buildLatter(cevap),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    widget.isFilled = false;

                    if (soruNumber == 20 && widget.soruTuru == "Zor") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WinPage(),
                          ));
                    } else if (soruNumber == 18 && widget.soruTuru == "Orta") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WinPage(),
                          ));
                    } else if (soruNumber == 20 && widget.soruTuru == "Kolay") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WinPage(),
                          ));
                    } else if (widget.answerList
                        .any((element) => element == false)) {
                      widget.answerList.clear();
                      for (var latter in cevap.split("")) {
                        widget.answerList.add(false);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 1),
                        backgroundColor: Color.fromRGBO(219, 110, 0, 1),
                        content: Text('Cevap Yanlış!! Tekrar deneyiniz'),
                      ));
                    } else {
                      soruNumber++;

                      widget.answerList.clear();
                      for (var latter in cevap.split("")) {
                        widget.answerList.add(false);
                      }
                    }
                    setState(() {});
                  },
                  child: const Text(
                    "Sıradaki Soru",
                    style: TextStyle(
                        color: Color.fromARGB(255, 17, 91, 150), fontSize: 25),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }

  List<Widget> buildLatter(String word) {
    List wordList = word.split('').toList()..shuffle();
    List<Widget> tempWidgetList = [];
    for (var latter in wordList) {
      tempWidgetList.add(LattersWidget(
        isCompleted: widget.isCompleted,
        latter: latter,
        numberOfLetters: wordList.length,
        onDragCompleted: () {},
      ));
    }
    return tempWidgetList;
  }

  List<Widget> buildLatterTarget(String word) {
    List wordList = word.split('').toList();
    List<Widget> tempWidgetList = [];
    var i = 0;
    widget.answerList.clear();
    for (var latter in wordList) {
      widget.answerList.add(false);
      tempWidgetList.add(LattersTargetWidget(
        index: i,
        ifTrue: (index) {
          widget.answerList[index] = true;
        },
        isFilled: widget.isFilled,
        latter: latter,
        numberOfLetters: wordList.length,
      ));
      i++;
    }
    return tempWidgetList;
  }

  Future<Question?> getData() async {
    var question = await widget.apiService.getQuestion(
        tur: widget.soruTuru.toLowerCase(), soruNumber: soruNumber.toString());
    if (question == null) {
      soruNumber++;
      setState(() {});
    } else {
      if (question.soru == null) {
        soruNumber++;
        setState(() {});
      } else {
        return question;
      }
    }
    return null;
  }
}

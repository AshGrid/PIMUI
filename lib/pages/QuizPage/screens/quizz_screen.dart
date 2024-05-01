import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:sneakers_app/models/answer.dart';
import 'package:sneakers_app/models/question_bank.dart';
import 'package:sneakers_app/pages/QuizPage/screens/QuizPage.dart';
import 'package:sneakers_app/pages/QuizPage/screens/components/option_area.dart';
import 'package:sneakers_app/pages/QuizPage/screens/components/option_button.dart';
import 'package:sneakers_app/pages/QuizPage/screens/components/painter.dart';
import 'package:sneakers_app/pages/QuizPage/screens/widgets/constants.dart';
import 'package:sneakers_app/pages/QuizPage/screens/widgets/custom_button.dart';
import 'package:sneakers_app/pages/QuizPage/screens/congrats_page.dart';
import 'package:swipe/swipe.dart'; // Importez QuizResultsScreen

class Quizzes extends StatefulWidget {
  const Quizzes({Key? key}) : super(key: key);

  @override
  State<Quizzes> createState() => _QuizState();
}

class _QuizState extends State<Quizzes> {
  late QuestionBank questionBank;
  late int endTime;

  @override
  void initState() {
    questionBank = QuestionBank();
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 15; // 15 minutes
    super.initState();
  }

  var questionIndex = 0;

  Icon uncheckedButtonAnswer =
      OptionButton(icon: Icons.radio_button_unchecked, color: kBlue);
  Icon checkedButtonAnswer =
      OptionButton(icon: Icons.radio_button_checked_outlined, color: Colors.white);

  final optionCheckedColor = kBlue;
  final optionUncheckedColor = const Color(0xffffffff);

  final optionCheckedFontColor = Colors.white;
  final optionUncheckedFontColor = Colors.black87;
  final correctOptionGreen = Colors.green;

  AnswersSelected firstAnswer = AnswersSelected.unselected;
  AnswersSelected secondAnswer = AnswersSelected.unselected;
  AnswersSelected thirdAnswer = AnswersSelected.unselected;
  AnswersSelected fourthAnswer = AnswersSelected.unselected;

  bool first = false;
  bool second = false;
  bool third = false;
  bool fourth = false;

  void isBlank() {
    if (firstAnswer == AnswersSelected.unselected &&
        secondAnswer == AnswersSelected.unselected &&
        thirdAnswer == AnswersSelected.unselected &&
        fourthAnswer == AnswersSelected.unselected) {
      setState(() {
        questionBank.questionBank[questionIndex].areUnselected = true;
      });
    } else {
      setState(() {
        questionBank.questionBank[questionIndex].areUnselected = false;
      });
    }
  }

  void writeAnswers() {
    questionBank.questionBank[questionIndex].options[0].firstAnswer = firstAnswer;
    questionBank.questionBank[questionIndex].options[1].secondAnswer = secondAnswer;
    questionBank.questionBank[questionIndex].options[2].thirdAnswer = thirdAnswer;
    questionBank.questionBank[questionIndex].options[3].fourthAnswer = fourthAnswer;
  }

  void readAnswers() {
    firstAnswer = questionBank.questionBank[questionIndex].options[0].firstAnswer!;
    secondAnswer = questionBank.questionBank[questionIndex].options[1].secondAnswer!;
    thirdAnswer = questionBank.questionBank[questionIndex].options[2].thirdAnswer!;
    fourthAnswer = questionBank.questionBank[questionIndex].options[3].fourthAnswer!;
  }

  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGrayishBlue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LayoutBuilder(builder: (_, constraints) => Container(
              color: Color(0xffF7F7F8),
              height: 105.0,
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: CustomPaint(
                painter: Painter(),
              ),
            ),),
            CountdownTimer(
              endTime: endTime,
              textStyle: TextStyle(fontSize: 20, color: Colors.red),
              onEnd: () {
                print('Countdown ended');
                // Ajoutez ici ce que vous voulez faire lorsque le décompte est terminé
              },
            ),
            Swipe(
              onSwipeLeft: () {
                setState(() {
                  if (questionIndex > 0) {
                    writeAnswers();
                    isBlank();
                    questionIndex = questionIndex - 1;
                    readAnswers();
                  }
                });
              },
              onSwipeRight: () {
                setState(() {
                  if (questionIndex < questionBank.questionBank.length - 1) {
                    writeAnswers();
                    isBlank();
                    questionIndex = questionIndex + 1;
                    readAnswers();
                  }
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.60,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0, bottom: 10.0),
                        child: Text(
                          '${questionIndex + 1}. ${questionBank.questionBank[questionIndex].text.toString()}',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      OptionArea(
                        function: () {
                          setState(() {
                            firstAnswer = firstAnswer == AnswersSelected.unselected ? AnswersSelected.firstAnswer : AnswersSelected.unselected;
                            isBlank();
                          });
                        },
                        iconToggle: firstAnswer == AnswersSelected.unselected ? uncheckedButtonAnswer : checkedButtonAnswer,
                        questionText: '1. ${questionBank.questionBank[questionIndex].options[0].option}',
                        buttonColorToggle: firstAnswer == AnswersSelected.unselected ? optionUncheckedColor : optionCheckedColor,
                        buttonTextColorToggle: first == false ? (firstAnswer == AnswersSelected.unselected ? optionUncheckedFontColor : optionCheckedFontColor) : correctOptionGreen,
                      ),
                      SizedBox(height: 10.0),
                      OptionArea(
                        function: () {
                          setState(() {
                            secondAnswer = secondAnswer == AnswersSelected.unselected ? AnswersSelected.secondAnswer : AnswersSelected.unselected;
                            isBlank();
                          });
                        },
                        iconToggle: secondAnswer == AnswersSelected.unselected ? uncheckedButtonAnswer : checkedButtonAnswer,
                        questionText: '2. ${questionBank.questionBank[questionIndex].options[1].option}',
                        buttonColorToggle: secondAnswer == AnswersSelected.unselected ? optionUncheckedColor : optionCheckedColor,
                        buttonTextColorToggle: second == false ? (secondAnswer == AnswersSelected.unselected ? optionUncheckedFontColor : optionCheckedFontColor) : correctOptionGreen,
                      ),
                      SizedBox(height: 10.0),
                      OptionArea(
                        function: () {
                          setState(() {
                            thirdAnswer = thirdAnswer == AnswersSelected.unselected ? AnswersSelected.thirdAnswer : AnswersSelected.unselected;
                            isBlank();
                          });
                        },
                        iconToggle: thirdAnswer == AnswersSelected.unselected ? uncheckedButtonAnswer : checkedButtonAnswer,
                        questionText: '3. ${questionBank.questionBank[questionIndex].options[2].option}',
                        buttonColorToggle: thirdAnswer == AnswersSelected.unselected ? optionUncheckedColor : optionCheckedColor,
                        buttonTextColorToggle: third == false ? (thirdAnswer == AnswersSelected.unselected ? optionUncheckedFontColor : optionCheckedFontColor) : correctOptionGreen,
                      ),
                      SizedBox(height: 10.0),
                      OptionArea(
                        function: () {
                          setState(() {
                            fourthAnswer = fourthAnswer == AnswersSelected.unselected ? AnswersSelected.fourthAnswer : AnswersSelected.unselected;
                            isBlank();
                          });
                        },
                        iconToggle: fourthAnswer == AnswersSelected.unselected ? uncheckedButtonAnswer : checkedButtonAnswer,
                        questionText: '4. ${questionBank.questionBank[questionIndex].options[3].option}',
                        buttonColorToggle: fourthAnswer == AnswersSelected.unselected ? optionUncheckedColor : optionCheckedColor,
                        buttonTextColorToggle: fourth == false ? (fourthAnswer == AnswersSelected.unselected ? optionUncheckedFontColor : optionCheckedFontColor) : correctOptionGreen,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  background: Colors.blue,
                  onPressed: () {
                    setState(() {
                      questionIndex = 0;
                      firstAnswer = AnswersSelected.unselected;
                      secondAnswer = AnswersSelected.unselected;
                      thirdAnswer = AnswersSelected.unselected;
                      fourthAnswer = AnswersSelected.unselected;
                    });
                  },
                  label: 'Start Random Quiz',
                  textColor: Colors.white,
                ),
                CustomButton(
                  background: Colors.green,
                  onPressed: () {
                    writeAnswers();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CongratsPage()), // Fournissez les valeurs nécessaires pour score et totalQuestions
                    );
                  },
                  label: 'Finish Quiz',
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:islamic_quiz/configs/configs.dart';
import 'package:islamic_quiz/controllers/controllers.dart';
import 'package:islamic_quiz/screens/screens.dart';
import 'package:islamic_quiz/widgets/widgets.dart';

import 'answer_check_screen.dart';

class Resultcreen extends GetView<QuizController> {
  const Resultcreen({Key? key}) : super(key: key);

  static const String routeName = '/resultscreen';

  @override
  Widget build(BuildContext context) {
    final Color _textColor = UIParameters.isDarkMode(context)
        ? Colors.white
        : Theme.of(context).primaryColor;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: BackgroundDecoration(
          child: Column(
            children: [
              CustomAppBar(
                leading: const SizedBox(
                  height: kToolbarHeight,
                ),
                title: controller.correctAnsweredQuestions,
              ),
              Expanded(
                child: ContentArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          color: UIParameters.isDarkMode(context)
                              ? const Color.fromARGB(255, 11, 41, 56)
                              : const Color.fromARGB(255, 221, 221, 221),
                          child: SvgPicture.asset(
                            'assets/images/bulb.svg',
                            color: kCorrectAnswerColor,
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          color: UIParameters.isDarkMode(context)
                              ? const Color.fromARGB(255, 11, 41, 56)
                              : const Color.fromARGB(255, 221, 221, 221),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 5),
                            child: Text(
                              'تـهـانـيـنـا',
                              style: kHeaderTS.copyWith(color: _textColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          color: UIParameters.isDarkMode(context)
                              ? const Color.fromARGB(255, 11, 41, 56)
                              : const Color.fromARGB(255, 221, 221, 221),
                          child: Text(
                            'لقد حصلت علي ${controller.points} نقطة',
                            style: TextStyle(
                              color: _textColor,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 45,
                          width: double.maxFinite,
                          color: UIParameters.isDarkMode(context)
                              ? const Color.fromARGB(255, 11, 41, 56)
                              : const Color.fromARGB(255, 221, 221, 221),
                          child: const Text(
                            'انقر فوق أرقام الأسئلة أدناه لعرض الإجابات الصحيحة',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                       /* const SizedBox(
                          height: 25,
                        ),*/
                        Expanded(
                            child: GridView.builder(
                                itemCount: controller.allQuestions.length,
                                shrinkWrap: true,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                    UIParameters.getWidth(context) ~/ 75,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (_, index) {
                                  final _question = controller.allQuestions[index];
                                  AnswerStatus _status = AnswerStatus.notanswered;
                                  final _selectedAnswer = _question.selectedAnswer;
                                  final _correctAnswer = _question.correctAnswer;
                                  if (_selectedAnswer == _correctAnswer) {
                                    _status = AnswerStatus.correct;
                                  } else if (_question.selectedAnswer == null) {
                                    _status = AnswerStatus.wrong;
                                  } else {
                                    _status = AnswerStatus.wrong;
                                  }

                                  return QuizNumberCard(
                                    index: index + 1,
                                    status: _status,
                                    onTap: () {
                                      controller.jumpToQuestion(index,
                                          isGoBack: false,
                                      );
                                      Get.toNamed(AnswersCheckScreen.routeName);
                                      },
                                  );
                                },
                            ),
                        ),],
                    ),
                ),
              ),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                    padding: UIParameters.screenPadding,
                    child: Row(
                      children: [
                        Expanded(
                            child: MainButton(
                              color: Colors.blueGrey,
                              onTap: () {
                                controller.tryAgain();
                                },
                              title: 'إعادة مره اخرى',
                            ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: MainButton(
                              onTap: () {
                                controller.saveQuizResults();
                                },
                              title: 'إلي الصفحة الرئيسية',
                            ),
                        )
                      ],
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

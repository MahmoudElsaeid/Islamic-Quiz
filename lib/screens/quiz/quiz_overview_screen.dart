import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_quiz/configs/configs.dart';
import 'package:islamic_quiz/controllers/controllers.dart';
import 'package:islamic_quiz/widgets/widgets.dart';

class QuizOverviewScreen extends GetView<QuizController> {
  const QuizOverviewScreen({Key? key}) : super(key: key);

  static const String routeName = '/quizeoverview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  CustomAppBar(
        title: controller.completedQuiz,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(kButtonCornerRadius),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left:kMobileScreenPadding * 3.5),
                          child: Row(
                            children: [
                              CountdownTimer(
                                color: UIParameters.isDarkMode(context)
                                    ? Theme.of(context).textTheme.bodyText1!.color
                                    : Theme.of(context).primaryColor, time: '',
                              ),
                              Obx(
                                    () => Text(
                                      '${controller.time} مـتـبـقـي ',
                                      style: countDownTimerTs(context),
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
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
                                AnswerStatus? _answerStatus;
                                if(controller.allQuestions[index].selectedAnswer != null){
                                  _answerStatus = AnswerStatus.answered;
                                }
                                return QuizNumberCard(
                                  index: index+1, status: _answerStatus, onTap: () {
                                    controller.jumpToQuestion(index);
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
                child: MainButton(
                  onTap: () {
                    controller.complete();
                    },
                  title: 'اضغط هنا لأظهار النتيجة',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

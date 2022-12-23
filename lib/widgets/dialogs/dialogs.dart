import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_quiz/configs/configs.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  Dialogs._internal();

  static Widget quizStartDialog({required VoidCallback onTap}) {
    return AlertDialog(
      backgroundColor: scaffoldBackgroundColor.withOpacity(1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:  [
        
          Text(
            "..اهلا",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          Text(
              "الرجاء تسجيل الدخول قبل بدء الاختبار",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: onTap,
            child:  Text(
                'حسناً',
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: kPrimayLightColorLT
              ),
            ),
        )
      ],
    );
  }

  static Future<bool> quizEndDialog() async{
     return (await showDialog(
      context: Get.overlayContext!,
      builder: (context) =>  AlertDialog(
        backgroundColor: scaffoldBackgroundColor.withOpacity(1.0),
        contentTextStyle: TextStyle(
            color: Colors.white
        ),
        titleTextStyle: TextStyle(
            color: Colors.white
        ),
        title:  const Text(
          'هل أنت متأكد؟',
          textAlign: TextAlign.end,
        ),
        content:  const Text(
          'هل تريد الخروج من الاختبار دون استكماله؟',
          textAlign: TextAlign.end,
        ),

        actions: <Widget>[
          TextButton(
            onPressed: () =>  Get.back(result: false),
            child:  const Text(
              'لا',
              style: TextStyle(
                  color: kPrimayLightColorLT
              ),
            ),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child:   Text(
              'نعم',
              style: TextStyle(
                  color: kPrimayLightColorLT
              ),
            ),
          ),
        ],
      ),
    )) ?? false;

  }
}

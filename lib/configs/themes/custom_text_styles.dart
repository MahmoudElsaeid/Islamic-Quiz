import 'package:flutter/material.dart';
import 'package:islamic_quiz/configs/configs.dart';

const kHeaderTS = TextStyle(
  fontFamily: 'Almarai',
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: kOnSurfaceTextColor,
);

const kDetailsTS = TextStyle(
  fontSize: 14,
  fontFamily: 'Almarai',
);

TextStyle cardTitleTs(context) => TextStyle(
  color: UIParameters.isDarkMode(context)
      ? Theme.of(context).textTheme.bodyText1!.color
      : Theme.of(context).primaryColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  fontFamily: 'Almarai',
);

const kQuizeTS = TextStyle(
  fontFamily: 'Almarai',
  fontSize: 16,
  fontWeight: FontWeight.w800,
);

const kAppBarTS = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: kOnSurfaceTextColor,
  fontFamily: 'Almarai',
);

TextStyle countDownTimerTs(context) => TextStyle(
  letterSpacing: 2,
  color: UIParameters.isDarkMode(context)
      ? Theme.of(context).textTheme.bodyText1!.color
      : Theme.of(context).primaryColor,
  fontSize: 16,
  fontWeight: FontWeight.bold,
  fontFamily: 'Almarai',
);

const kQuizeNumberCardTs = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: kOnSurfaceTextColor,
  fontFamily: 'Almarai',
);

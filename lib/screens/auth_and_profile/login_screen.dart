import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:islamic_quiz/configs/configs.dart';
import 'package:islamic_quiz/controllers/auth_controller.dart';
import 'package:islamic_quiz/widgets/widgets.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Container(
          constraints: const BoxConstraints(maxWidth: kTabletChangePoint),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/splash_logo.svg',
                height: 200,
                //width: 30,
              ),
              Padding(
                padding: EdgeInsets.only(top: 18, bottom: 220, left: 11, right: 11),
                child: Text(
                  'يجب عليك تسجيل الدخول لـتتمكن من دخولك إلي الأختبارات والتمتع بالمزايا الاخري',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: kOnSurfaceTextColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Almarai"
                  ),
                ),
              ),
              MainButton(
                onTap: () {
                  controller.siginInWithGoogle();
                 },
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        child: SvgPicture.asset(
                          'assets/icons/google.svg',
                        )),
                    Center(
                      child: Text(
                        'Sign in  with google',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

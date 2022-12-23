import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:islamic_quiz/configs/configs.dart';
import 'package:islamic_quiz/controllers/controllers.dart';
import 'package:islamic_quiz/widgets/widgets.dart';

import 'custom_drawer.dart';

class HomeScreen extends GetView<MyDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    QuizPaperController _quizePprContoller = Get.find();
    return Scaffold(
        body: GetBuilder<MyDrawerController>(
          builder: (_) => ZoomDrawer(
            controller: _.zoomDrawerController,
            borderRadius: 50.0,
            showShadow: true,
            angle: 0.0,
            style: DrawerStyle.DefaultStyle,
            menuScreen: const CustomDrawer(),
            backgroundColor: Colors.white.withOpacity(0.5),
            slideWidth: MediaQuery.of(context).size.width * 0.6,
            mainScreen: Container(
              decoration: BoxDecoration(
                  gradient: mainGradient(context)),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kMobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Transform.translate(
                            offset: const Offset(-10, 0),
                            child: CircularButton(
                              child: const Icon(AppIcons.menuleft),
                              onTap: controller.toggleDrawer,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(AppIcons.peace),
                                Builder(
                                  builder: (_) {
                                    final AuthController _auth = Get.find();
                                    final user = _auth.getUser();
                                    String _label = '  مرحباً يا صديقي';
                                    if (user != null) {
                                      _label = '${user.displayName}مرحباً ';
                                    }
                                    return Text(_label,
                                        style: kDetailsTS.copyWith(
                                          color: kOnSurfaceTextColor,
                                        )
                                    );
                                    },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                 SizedBox(height: 8,),
                                 Text('جاهز الأن لأختبار معلوماتك ؟',
                                    style: kHeaderTS),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ContentArea(
                          addPadding: false,
                          child: Container(
                            child: Obx(
                                  () => LiquidPullToRefresh(
                                    height: 100,
                                    backgroundColor: Colors.white70.withOpacity(0.6),
                                    springAnimationDurationInMilliseconds: 500,
                                    //backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                                    onRefresh: () async {
                                      _quizePprContoller.getAllPapers();
                                      },
                                    child: ListView.separated(
                                      //physics: AlwaysScrollableScrollPhysics(),
                                      padding: UIParameters.screenPadding,
                                      shrinkWrap: true,
                                      itemCount: _quizePprContoller.allPapers.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return QuizPaperCard(
                                          model: _quizePprContoller.allPapers[index],
                                        );
                                        },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(height: 20,);
                                        },
                                    ),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}

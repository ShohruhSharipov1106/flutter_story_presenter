import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  double currentPageValue = 0.0;

  //Story Data
  List<StoryModel> sampleStory = [
    StoryModel(
      userName: 'Kaival Patel',
      userProfile: 'https://avatars.githubusercontent.com/u/39383435?v=4',
      stories: [
        StoryItem(
          storyItemType: StoryItemType.image,
          imageConfig: const StoryViewImageConfig(
            fit: BoxFit.cover,
          ),
          description:
              'Yoshlarning ilmiy va innovatsion faoliyatini qoʻllab-quvvatlash, gaz taʼminoti sohasida samaradorlikka erishish hamda startap loyihalarni rivojlantirish maqsadida tashkil etilgan “Eng yaxshi ilmiy ishlanma” startap loyihalar tanlovining yakuniy bosqichi oʻz yakuniga yetdi. Natijalar 10 kun muddatda “Hududgaztaʼminot” AJning rasmiy veb-sayti va kanallarida eʼlon qilinadi.',
          url: "https://hgt-dev-cdn.uicgroup.tech/hgt/simple_story.png",
        ),
        StoryItem(
          storyItemType: StoryItemType.image,
          imageConfig: const StoryViewImageConfig(
            fit: BoxFit.cover,
          ),
          description:
              'Yoshlarning ilmiy va innovatsion faoliyatini qoʻllab-quvvatlash, gaz taʼminoti sohasida samaradorlikka erishish hamda startap loyihalarni rivojlantirish maqsadida tashkil etilgan “Eng yaxshi ilmiy ishlanma” startap loyihalar tanlovining yakuniy bosqichi oʻz yakuniga yetdi. Natijalar 10 kun muddatda “Hududgaztaʼminot” AJning rasmiy veb-sayti va kanallarida eʼlon qilinadi.',
          url: "https://hgt-dev-cdn.uicgroup.tech/hgt/image.png",
        ),
        StoryItem(
          storyItemType: StoryItemType.video,
          storyItemSource: StoryItemSource.network,
          url:
              'https://hgt-dev-cdn.uicgroup.tech/hgt/Prezidentimiz_Yunusobod_tumanida_yangi_ochilgan__High_Town_Mall__savdo-kongilochar_majmuasida.mp4',
          thumbnail: const Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(
                radius: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Video Loading')
            ],
          )),
          videoConfig: const StoryViewVideoConfig(
            cacheVideo: true,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            loadingWidget: Center(child: CupertinoActivityIndicator()),
          ),
        ),
        StoryItem(
          storyItemSource: StoryItemSource.network,
          storyItemType: StoryItemType.video,
          url:
              'https://videos.pexels.com/video-files/5913245/5913245-uhd_1440_2560_30fps.mp4',
          videoConfig: const StoryViewVideoConfig(
            cacheVideo: true,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            loadingWidget: Center(child: CupertinoActivityIndicator()),
          ),
        ),
      ],
    ),
    // StoryModel(
    //   userName: 'Lakhan P.',
    //   userProfile: 'https://devkrest.com/team/lakhan.png',
    //   stories: [
    //     StoryItem(
    //       storyItemType: StoryItemType.custom,
    //       duration: const Duration(seconds: 20),
    //       customWidget: (p0, audioPlayer) => PostOverlayView(
    //         controller: p0,
    //       ),
    //       imageConfig: StoryViewImageConfig(
    //         fit: BoxFit.contain,
    //         progressIndicatorBuilder: (p0, p1, p2) => const Center(
    //           child: CupertinoActivityIndicator(),
    //         ),
    //       ),
    //     ),
    //     StoryItem(
    //       storyItemType: StoryItemType.video,
    //       storyItemSource: StoryItemSource.asset,
    //       url: 'assets/StorySaver.net-_spindia_-Video-1718781607686.mp4',
    //       thumbnail: const Center(
    //           child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           CupertinoActivityIndicator(
    //             radius: 15,
    //           ),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           Text('Video Loading')
    //         ],
    //       )),
    //       videoConfig: const StoryViewVideoConfig(
    //         fit: BoxFit.contain,
    //       ),
    //     ),
    //   ],
    // ),
    // StoryModel(
    //   userName: 'Harsh P.',
    //   userProfile: 'https://devkrest.com/team/harsh.jpg',
    //   stories: [
    //     StoryItem(
    //       storyItemType: StoryItemType.text,
    //       textConfig: StoryViewTextConfig(
    //           textWidget: const Text(
    //             "Happy Independence Day",
    //             style: TextStyle(
    //                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24, fontStyle: FontStyle.italic),
    //           ),
    //           backgroundWidget: Container(
    //             decoration: const BoxDecoration(
    //                 gradient: LinearGradient(
    //                     begin: Alignment.topCenter,
    //                     end: Alignment.bottomCenter,
    //                     colors: [Colors.deepOrange, Colors.white, Colors.green])),
    //           )),
    //       url: "Happy Independence Day",
    //     ),
    //     StoryItem(
    //       storyItemType: StoryItemType.web,
    //       url:
    //           'https://www.ndtv.com/webstories/travel/10-things-to-do-in-amritsar-from-golden-temple-visit-to-wagah-border-47',
    //       duration: const Duration(seconds: 20),
    //       imageConfig: StoryViewImageConfig(
    //         fit: BoxFit.contain,
    //         progressIndicatorBuilder: (p0, p1, p2) => const Center(
    //           child: CupertinoActivityIndicator(),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
  ];

  @override
  void initState() {
    super.initState();
  }

  multiStoryView() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        itemCount: sampleStory.length,
        // physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            child: MyStoryView(
              storyModel: sampleStory[index],
              pageController: pageController,
            ),
            builder: (context, child) {
              if (pageController.position.hasContentDimensions) {
                currentPageValue = pageController.page ?? 0.0;
                final isLeaving = (index - currentPageValue) <= 0;
                final t = (index - currentPageValue);
                final rotationY = lerpDouble(0, 30, t)!;
                const maxOpacity = 0.8;
                final num opacity = lerpDouble(0, maxOpacity, t.abs())!.clamp(0.0, maxOpacity);
                final isPaging = opacity != maxOpacity;
                final transform = Matrix4.identity();
                transform.setEntry(3, 2, 0.003);
                transform.rotateY(-rotationY * (pi / 180.0));
                return Transform(
                  alignment: isLeaving ? Alignment.centerRight : Alignment.centerLeft,
                  transform: transform,
                  child: Stack(
                    children: [
                      child!,
                      if (isPaging && !isLeaving)
                        Positioned.fill(
                          child: Opacity(
                            opacity: opacity as double,
                            child: const ColoredBox(
                              color: Colors.black87,
                            ),
                          ),
                        )
                    ],
                  ),
                );
              }

              return child!;
            },
          );
        },
      ),
    );
  }
}

class MyStoryView extends StatefulWidget {
  const MyStoryView({
    super.key,
    required this.storyModel,
    required this.pageController,
  });

  final StoryModel storyModel;
  final PageController pageController;

  @override
  State<MyStoryView> createState() => _MyStoryViewState();
}

class _MyStoryViewState extends State<MyStoryView> {
  late FlutterStoryController controller;

  @override
  void initState() {
    controller = FlutterStoryController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storyViewIndicatorConfig = StoryViewIndicatorConfig(
      height: 4,
      activeColor: Colors.white,
      backgroundCompletedColor: Colors.white,
      backgroundDisabledColor: Colors.white.withOpacity(0.5),
      horizontalGap: 1,
      borderRadius: 1.5,
    );

    return FlutterStoryPresenter(
      restartOnCompleted: false,
      flutterStoryController: controller,
      items: widget.storyModel.stories,
      footerWidget: MessageBoxView(controller: controller),
      storyViewIndicatorConfig: storyViewIndicatorConfig,
      initialIndex: 0,
      useBorderRadius: true,
      borderRadius: BorderRadius.circular(12),
      topGradient: LinearGradient(
        colors: [
          Colors.black,
          Colors.black.withAlpha(0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      headerWidget: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 16,
          left: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 20,
                  sigmaX: 20,
                ),
                child: const Icon(
                  Icons.close,
                ),
              ),
            )
          ],
        ),
      ),
      onStoryChanged: (p0) {},
      onPreviousCompleted: () async {
        // await widget.pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
      },
      onCompleted: () async {
        // await widget.pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
        controller = FlutterStoryController();
      },
    );
  }
}

class MessageBoxView extends StatelessWidget {
  const MessageBoxView({
    super.key,
    required this.controller,
  });

  final FlutterStoryController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(999),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                onTap: () {
                  controller.pause();
                },
                onTapOutside: (event) {
                  controller.play();
                  FocusScope.of(context).unfocus();
                },
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                    hintText: 'Enter Message',
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 6)),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: Transform.rotate(
              angle: -0.6,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 9),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Custom Story Data Model
class StoryModel {
  String userName;
  String userProfile;
  List<StoryItem> stories;

  StoryModel({
    required this.userName,
    required this.userProfile,
    required this.stories,
  });
}

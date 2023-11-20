import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funmap/features/authentication/presentation/pages/splash_screen.dart';
import 'package:funmap/features/authentication/presentation/widgets/dot_indicator_widget.dart';
import 'package:get/get.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<UnbordingContent> contents = [
    UnbordingContent(
        title: 'FUN WAY TO NAVIGATE',
        image: 'assets/images/splash_slider1.png',
        discription:
        "Discover a collection of inspiring and motivation quotes from Muslim personalities!"),
    UnbordingContent(
        title: 'FIND YOUR FUN PLACES',
        image: 'assets/images/splash_slider2.png',
        discription:
        "Use our amazing filters to immerse yourselves in the worlds largest directory!"),
    UnbordingContent(
        title: 'CHARACTERS FUN FACTS',
        image: 'assets/images/splash_slider3.png',
        discription:
        "Create your own custom lists to easily refer back to your favourites!"),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isLastPage = currentIndex == contents.length - 1;
    final buttonText = isLastPage ? "Get Started" : "Continue";

    const Color c1 = Color.fromRGBO(95, 103, 234, 1);
    const Color c2 = Color.fromRGBO(158, 164, 252, 1);

    return SafeArea(
      child: Scaffold(
        backgroundColor: c1,
        body: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Stack(
                  children: [
                    Positioned.fill(
                      top: height * -0.35,
                      left: height * -0.0,
                      right: height * -0.0,
                      child: Image.asset(
                        contents[i].image!, // Replace with your image path
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.60,
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        color: c1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 8.0, left: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    contents[i].title!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white
                                    ),
                                    // size: 24,
                                    // textAlign: TextAlign.center,
                                    // fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    contents[i].discription!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    ),
                                    // size: 16,
                                    // lineHeight: 1.4,
                                    // fontFamily: 'Gilroy',
                                    // textAlign: TextAlign.center,
                                    // fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromRGBO(255, 233, 133, 1),
                                Color.fromRGBO(250, 116, 43, 1)
                              ]),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (isLastPage) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SplashScreen(),
                          ));
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceIn,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                            (index) => Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: DotIndicator(
                            selected: index == currentIndex,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5)
                  ],
                ),
                /*child: MaterialButton(
                  child: Text(
                    "Next"
                  ),
                  color: c2,
                  // buttonText,
                  // buttonType: ButtonType.fill,
                  // width: width,
                  // expand: true,
                  // textStyle: const TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w400,
                  //     letterSpacing: 0.5),
                  onPressed: () {
                    if (isLastPage) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ));
                    } else {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    }
                  },
                ),*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnbordingContent {
  String? image;
  String? title;
  String? discription;

  UnbordingContent({this.image, this.title, this.discription});
}

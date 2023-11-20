import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funmap/features/authentication/presentation/controller/auth_controller.dart';
import 'package:funmap/features/authentication/presentation/pages/signin_page.dart';
import 'package:funmap/features/authentication/presentation/pages/signup_page.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String img = "assets/images/funmap.png";
    const Color c1 = Color.fromRGBO(95, 103, 234, 1);
    Size size = MediaQuery.of(context).size;

    return GetBuilder<AuthController>(builder: (authController) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            height: double.maxFinite,
            decoration: const BoxDecoration(color: c1
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [c1, c2],
                // ),
                ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: [
                  Container(
                    child: Image.asset(img),
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 140),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return SignupScreen();
                          }));
                        },
                      ),
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
                        child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 60,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 45,
                                spreadRadius: 0,
                                // color: Color.fromRGBO(120, 37, 139, 0.25),
                                color: Color.fromRGBO(158, 164, 252, 0.25),
                                offset: Offset(0, 25),
                              )
                            ],
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromRGBO(225, 225, 225, 0.28),
                          ),
                          child: const Text(
                            "Guest User",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return SigninScreen();
                                }));
                                },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

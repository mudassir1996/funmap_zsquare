

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funmap/features/authentication/presentation/controller/auth_controller.dart';
import 'package:funmap/features/authentication/presentation/pages/signin_page.dart';
import 'package:get/get.dart';

class ForgetPassScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    const Color c1 = Color.fromRGBO(95, 103, 234, 1);
    String img = "assets/images/funmap.png";

    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (authController) {
          return SafeArea(
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                leading: null,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
              ),
              body: Container(
                height: double.maxFinite,
                decoration: const BoxDecoration(
                    color: c1
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [c1, c2],
                  // ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      // Container(
                      //   child: Image.asset(img),
                      //   width: double.maxFinite,
                      //   // alignment: Alignment.center,
                      //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 140),
                      // ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            // child: Image.asset(img),
                            width: double.maxFinite,
                            // alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                          const SizedBox(height: 150),
                          Text(
                            "RESET PASSWORD",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white.withOpacity(1),
                                fontSize: 28,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "Enter the registered email to get the link",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                // fontSize: 18,
                                /*fontWeight: FontWeight.w400*/),
                          ),
                          const SizedBox(height: 25),
                          TextField(
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Color.fromRGBO(22, 27, 119, 1)),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20.0),
                              filled: true,
                              hintText: "Enter your email",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(158, 164, 252, 1)),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
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
                                "Send Link",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            onPressed: () {
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (_) {
                              //   return SignupScreen();
                              // }));
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return SigninScreen();
                                    }));
                                    },
                                  child: const Text(
                                    "Back to Sign In",
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
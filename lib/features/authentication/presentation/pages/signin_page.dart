

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funmap/features/authentication/presentation/controller/auth_controller.dart';
import 'package:funmap/features/authentication/presentation/pages/forget_pass_page.dart';
import 'package:funmap/features/authentication/presentation/pages/signup_page.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget{
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
                            child: Image.asset(img),
                            width: double.maxFinite,
                            // alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                          Text(
                            "SIGN IN!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white.withOpacity(1),
                                fontSize: 28,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Color.fromRGBO(22, 27, 119, 1)),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20.0),
                              filled: true,
                              hintText: "Username/Email",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(158, 164, 252, 1)),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Color.fromRGBO(22, 27, 119, 1)),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20.0),
                              filled: true,
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(158, 164, 252, 1)),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return ForgetPassScreen();
                                  }));
                                  },
                                child: const Text(
                                  "Forget Password?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
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
                                "Sign In",
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
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return SignupScreen();
                                    }));
                                    },
                                  child: const Text(
                                    "Sign Up",
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funmap/features/authentication/presentation/controller/auth_controller.dart';
import 'package:funmap/features/authentication/presentation/pages/signin_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class SignupScreen extends StatelessWidget {
  // const loginScreen({super.key});

  // bool value = false;

  @override
  Widget build(BuildContext context) {
    String img = "assets/images/funmap.png";
    const Color c1 = Color.fromRGBO(95, 103, 234, 1);
    Size size = MediaQuery.of(context).size;
    // const Color c2 = Color(0x4A51BA);


    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (authController) {
        return SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: false,
            appBar: AppBar(
              // forceMaterialTransparency: true,
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: OverflowBar(
                    overflowAlignment: OverflowBarAlignment.center,
                    children: [
                      // const SizedBox(height: 15),
                      Image.asset(img),
                      const SizedBox(height: 15),
                      Text(
                        "SIGN UP!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white.withOpacity(1),
                            fontSize: 28,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Color.fromRGBO(22, 27, 119, 1)),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20.0),
                          filled: true,
                          hintText: "Name",
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(158, 164, 252, 1)),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Color.fromRGBO(22, 27, 119, 1)),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20.0),
                          filled: true,
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(158, 164, 252, 1)),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                      const SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Color.fromRGBO(22, 27, 119, 1)),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20.0),
                          filled: true,
                          hintText: "Confirm Password",
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(158, 164, 252, 1)),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.white,
                            checkColor: c1,
                            side: const BorderSide(
                              width: 0,
                            ),
                            fillColor: MaterialStateProperty.all(Colors.white),
                            value: authController.checkBoxValue,
                            onChanged: (value)=>authController.setCheckBoxValue(value!)),
                          const Text(
                            "I agree the terms & conditions",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      CupertinoButton(
                        padding:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                            return SigninScreen();
                          }));
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                authController.setCheckBoxValue(true);
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return SigninScreen();
                                }));
                                },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.white),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

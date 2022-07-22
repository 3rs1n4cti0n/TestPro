import 'package:flutter/material.dart';
import 'package:test_pro/Pages/register_page.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    return Material(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 200, 30, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(child: Image.asset("Assets/TestProLogo.png")),
              const Text(
                "Text Pro will help you improve your health day by day, by providing you with the right information you need.",
                style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              // place Holder
              InkWell(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                }),
                child: Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Center(
                    child: Text(
                      "Continue with e-mail",
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: const Center(
                  child: Text(
                    "Sign in with ....",
                    style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: const Center(
                  child: Text(
                    "Sign in with ....",
                    style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
    
              InkWell(
                child: Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Center(
                    child: Text(
                      "Continue Without Signing Up",
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

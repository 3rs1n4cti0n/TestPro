import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool signUpIsSelected = true;
  String email = "";
  String password = "";
  Color selectedColor = Colors.white;
  Color notSelectedColor = Colors.transparent;
  bool passwordIsEqual = false;
  List<bool> isHidden = [true, true];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.1)),
                    child: InkWell(
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                      child: const Center(
                          child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 15,
                      )),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox())
              ],
            ),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                if (!signUpIsSelected) {
                                  signUpIsSelected = !signUpIsSelected;
                                  setState(() {});
                                }
                              },
                              child: Container(
                                width: 200,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: signUpIsSelected
                                        ? selectedColor
                                        : notSelectedColor,
                                    boxShadow: [
                                      if (signUpIsSelected)
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 3,
                                            spreadRadius: 1)
                                    ]),
                                child: const Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                if (signUpIsSelected) {
                                  signUpIsSelected = !signUpIsSelected;
                                  setState(() {});
                                }
                              },
                              child: Container(
                                width: 200,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: !signUpIsSelected
                                        ? selectedColor
                                        : notSelectedColor,
                                    boxShadow: [
                                      if (!signUpIsSelected)
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 3,
                                            spreadRadius: 1)
                                    ]),
                                child: const Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Flexible(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  if (signUpIsSelected)
                    SizedBox(
                      height: 300,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Email"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              height: 45,
                              child: TextField(
                                onChanged: ((value) => email = value),
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                          const Text("Create Password"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              height: 45,
                              child: TextField(
                                obscureText: isHidden[0],
                                onChanged: (value) => password = value,
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      splashColor: Colors.transparent,
                                      icon: const Icon(
                                          Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        isHidden[0] = !isHidden[0];
                                        setState(() {});
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                          const Text("Re-write Password"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              height: 45,
                              child: TextField(
                                onChanged: (value) {
                                  if (password == value) {
                                    passwordIsEqual = true;
                                  }
                                },
                                obscureText: isHidden[1],
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      splashColor: Colors.transparent,
                                      icon: const Icon(
                                          Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        isHidden[1] = !isHidden[1];
                                        setState(() {});
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                          const Flexible(
                              child: SizedBox(
                            height: 100,
                          )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                      const TextSpan(
                                          text:
                                              "By clicking Sign Up, you agree to our "),
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // TODO: implement Terms of Service
                                            },
                                          text: "Terms of Service",
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline)),
                                      const TextSpan(
                                          text: " and that you have read our "),
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // TODO: implement Privacy Policy
                                            },
                                          text: "Privacy Policy",
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline)),
                                    ])),
                          ),
                        ],
                      ),
                    ),
                  if (!signUpIsSelected)
                    SizedBox(
                      height: 300,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Email"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              height: 45,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                          const Text("Password"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              height: 45,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      splashColor: Colors.transparent,
                                      icon: const Icon(
                                          Icons.remove_red_eye_outlined),
                                      onPressed: () {},
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                          const Flexible(
                              child: SizedBox(
                            height: 10,
                          )),
                          Center(
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: InkWell(
                      onTap: (() {
                        // TODO: Continue to next page
                      }),
                      child: Container(
                        height: 60,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

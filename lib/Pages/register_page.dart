import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/Pages/home_page.dart';
import 'package:test_pro/Pages/register_name_page.dart';
import 'package:test_pro/Utilities/fitness_app_user.dart';
import 'package:crypto/crypto.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool signUpIsSelected = true;
  String email = "";
  String password = "";
  String rewritePassword = "";
  Color selectedColor = Colors.white;
  Color notSelectedColor = Colors.transparent;
  bool passwordIsEqual = false;
  List<bool> isHidden = [true, true, true];
  bool infoFilled = false;

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
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo[100]),
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
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none,
                                      color: (signUpIsSelected)
                                          ? Colors.black
                                          : Colors.white,
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
                                child: Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none,
                                      color: (!signUpIsSelected)
                                          ? Colors.black
                                          : Colors.white,
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
                      height: 270,
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
                                onChanged: ((value) {
                                  email = value;
                                  if (password != "" && email != "") {
                                    infoFilled = true;
                                  } else {
                                    infoFilled = false;
                                  }
                                  setState(() {});
                                }),
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
                                obscureText: isHidden[0],
                                onChanged: (value) {
                                  password = value;
                                  if (password.compareTo(rewritePassword) ==
                                      0) {
                                    passwordIsEqual = true;
                                  } else {
                                    passwordIsEqual = false;
                                  }
                                  if (password != "" && email != "") {
                                    infoFilled = true;
                                  } else {
                                    infoFilled = false;
                                  }
                                  setState(() {});
                                },
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
                                  rewritePassword = value;
                                  if (password.compareTo(rewritePassword) ==
                                      0) {
                                    passwordIsEqual = true;
                                  } else {
                                    passwordIsEqual = false;
                                  }
                                  if (password != "" &&
                                      email != "" &&
                                      passwordIsEqual) {
                                    infoFilled = true;
                                  } else {
                                    infoFilled = false;
                                  }
                                  setState(() {});
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
                            height: 150,
                          )),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
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
                                            text:
                                                " and that you have read our "),
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
                          ),
                        ],
                      ),
                    ),
                  if (!signUpIsSelected)
                    SizedBox(
                      height: 270,
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
                                onChanged: (value) {
                                  email = value;
                                  if (password != "" && email != "") {
                                    infoFilled = true;
                                  } else {
                                    infoFilled = false;
                                  }
                                  setState(() {});
                                },
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
                                obscureText: isHidden[2],
                                onChanged: (value) {
                                  password = value;
                                  if (password != "" && email != "") {
                                    infoFilled = true;
                                  } else {
                                    infoFilled = false;
                                  }
                                  setState(() {});
                                },
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      splashColor: Colors.transparent,
                                      icon: const Icon(
                                          Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        isHidden[2] = !isHidden[2];
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
                  const Flexible(
                      child: SizedBox(
                    height: 25,
                  )),
                  InkWell(
                    onTap: (() {
                      if (signUpIsSelected) {
                        FitnessUser.email = email;
                        // encrpyt data before storing to database
                        FitnessUser.password =
                            sha256.convert(utf8.encode(password)).toString();

                        if (infoFilled && passwordIsEqual) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NamePage()));
                        }
                      } else if (!signUpIsSelected) {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email, password: password);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    }),
                    child: Container(
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration(
                          color: (infoFilled && passwordIsEqual)
                              ? Colors.indigo
                              : Colors.indigo[200],
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
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/Pages/home_page.dart';
import 'package:test_pro/Utilities/fitness_app_user.dart';

class UserInfoPages extends StatefulWidget {
  UserInfoPages({Key? key}) : super(key: key);

  @override
  State<UserInfoPages> createState() => _UserInfoPagesState();
}

class _UserInfoPagesState extends State<UserInfoPages>
    with TickerProviderStateMixin {
  bool femaleSelected = false;
  bool maleSelected = false;
  FitnessUser fitnessUser = FitnessUser();

  // keep track of inputs and initial values for the picker
  int age = 50;
  int height = 170;
  int weight = 70;

  // controllers for scrolling and animating
  late PageController controller;
  late TabController tabController;
  late FixedExtentScrollController ageScrollController;
  late FixedExtentScrollController heightScrollController;
  late FixedExtentScrollController weightScrollController;

  @override
  void initState() {
    // add -1 because index starts at 0
    ageScrollController = FixedExtentScrollController(initialItem: age - 1);
    heightScrollController =
        FixedExtentScrollController(initialItem: height - 1);
    weightScrollController =
        FixedExtentScrollController(initialItem: weight - 1);
    controller = PageController();
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  // free memory from controllers to avoid leaks
  @override
  void dispose() {
    controller.dispose();
    tabController.dispose();
    ageScrollController.dispose();
    heightScrollController.dispose();
    weightScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FitnessUser.age = age;
    FitnessUser.height = height;
    FitnessUser.weight = weight;
    FitnessUser.gender = femaleSelected;
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            Stack(
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
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Flexible(
                      child: ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: ((bounds) {
                          return const LinearGradient(
                                  colors: [Colors.black, Colors.green])
                              .createShader(bounds);
                        }),
                        child: Image.asset(
                          "Assets/TestProLogo.png",
                          height: 30,
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                    child: PageView(
                  onPageChanged: (value) {
                    tabController.animateTo(value);
                  },
                  controller: controller,
                  children: [
                    SizedBox(
                      height: 500,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 70),
                            child: Text(
                              "What is your gender?",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 3,
                            child: SizedBox(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    femaleSelected = true;
                                    maleSelected = false;
                                    setState(() {
                                      FitnessUser.gender = false;
                                    });
                                  },
                                  constraints: const BoxConstraints(
                                      minHeight: 150, minWidth: 150),
                                  icon: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                spreadRadius: 3,
                                                blurRadius: 5)
                                          ]),
                                      child: Icon(
                                        Icons.female,
                                        size: 100,
                                        color: femaleSelected
                                            ? Colors.red
                                            : Colors.black.withOpacity(0.1),
                                      ))),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    femaleSelected = false;
                                    maleSelected = true;
                                    setState(() {
                                      FitnessUser.gender = true;
                                    });
                                  },
                                  constraints: const BoxConstraints(
                                      minHeight: 150, minWidth: 150),
                                  icon: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                spreadRadius: 3,
                                                blurRadius: 5)
                                          ]),
                                      child: Icon(
                                        Icons.male,
                                        size: 100,
                                        color: maleSelected
                                            ? Colors.indigo
                                            : Colors.black.withOpacity(0.1),
                                      ))),
                            ],
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 70),
                            child: Text(
                              "How old are you?",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 3,
                            child: SizedBox(),
                          ),
                          SizedBox(
                            height: 300,
                            child: CupertinoPicker(
                                scrollController: ageScrollController,
                                looping: true,
                                selectionOverlay: Container(
                                  decoration: BoxDecoration(
                                      border: Border.symmetric(
                                    horizontal: BorderSide(
                                        width: 3.0,
                                        color: Colors.black.withOpacity(0.05)),
                                  )),
                                ),
                                squeeze: 1.2,
                                magnification: 1.3,
                                backgroundColor: Colors.transparent,
                                itemExtent: 50,
                                onSelectedItemChanged: ((value) {
                                  setState(() {
                                    age = value;
                                    FitnessUser.age = age;
                                  });
                                }),
                                children: [
                                  for (int i = 1; i <= 100; i++)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Text(i.toString()),
                                    )
                                ]),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 70),
                            child: Text(
                              "What is your Height?",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 3,
                            child: SizedBox(),
                          ),
                          SizedBox(
                            height: 250,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 500,
                                    child: CupertinoPicker(
                                        scrollController:
                                            heightScrollController,
                                        looping: true,
                                        selectionOverlay: Container(
                                          decoration: BoxDecoration(
                                              border: Border.symmetric(
                                            horizontal: BorderSide(
                                                width: 3.0,
                                                color: Colors.black
                                                    .withOpacity(0.05)),
                                          )),
                                        ),
                                        squeeze: 1.2,
                                        magnification: 1.3,
                                        backgroundColor: Colors.transparent,
                                        itemExtent: 50,
                                        onSelectedItemChanged: ((value) {
                                          setState(() {
                                            height = value;
                                            FitnessUser.height = height;
                                          });
                                        }),
                                        children: [
                                          for (int i = 1; i <= 230; i++)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 15.0, 0, 0),
                                              child: Text(i.toString()),
                                            )
                                        ]),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    width: 70,
                                    child: CupertinoPicker(
                                      selectionOverlay: Container(),
                                      squeeze: 1.2,
                                      magnification: 1.3,
                                      backgroundColor: Colors.transparent,
                                      itemExtent: 50,
                                      onSelectedItemChanged: ((value) {
                                        setState(() {});
                                      }),
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text("cm"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text("ft"),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 70),
                            child: Text(
                              "What is your Weight?",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 3,
                            child: SizedBox(),
                          ),
                          SizedBox(
                            height: 250,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 500,
                                    child: CupertinoPicker(
                                        scrollController:
                                            weightScrollController,
                                        looping: true,
                                        selectionOverlay: Container(
                                          decoration: BoxDecoration(
                                              border: Border.symmetric(
                                            horizontal: BorderSide(
                                                width: 3.0,
                                                color: Colors.black
                                                    .withOpacity(0.05)),
                                          )),
                                        ),
                                        squeeze: 1.2,
                                        magnification: 1.3,
                                        backgroundColor: Colors.transparent,
                                        itemExtent: 50,
                                        onSelectedItemChanged: ((value) {
                                          setState(() {
                                            weight = value;
                                            FitnessUser.weight = weight;
                                          });
                                        }),
                                        children: [
                                          for (int i = 1; i <= 150; i++)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 15.0, 0, 0),
                                              child: Text(i.toString()),
                                            )
                                        ]),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    width: 70,
                                    child: CupertinoPicker(
                                      selectionOverlay: Container(),
                                      squeeze: 1.2,
                                      magnification: 1.3,
                                      backgroundColor: Colors.transparent,
                                      itemExtent: 50,
                                      onSelectedItemChanged: ((value) {
                                        setState(() {});
                                      }),
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text("kg"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text("lb"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: (() async {
                  if (controller.page!.toInt() == 3) {
                    if (FirebaseAuth.instance.currentUser == null) {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: FitnessUser.email,
                                password: sha256.convert(utf8.encode(FitnessUser.password)).toString())
                            .then((value) {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        });
                      } catch (e) {}
                    }
                  }
                  int nextPage = (controller.page!.toInt() + 1).clamp(0, 3);
                  controller.animateToPage(nextPage,
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeOut);
                  tabController.animateTo(nextPage);
                }),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TabPageSelector(
                color: Colors.grey.withOpacity(0.2),
                controller: tabController,
                borderStyle: BorderStyle.none,
                selectedColor: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

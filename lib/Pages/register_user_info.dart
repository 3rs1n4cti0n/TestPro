import 'package:flutter/material.dart';

class UserInfoPages extends StatefulWidget {
  UserInfoPages({Key? key}) : super(key: key);

  @override
  State<UserInfoPages> createState() => _UserInfoPagesState();
}

class _UserInfoPagesState extends State<UserInfoPages>
    with TickerProviderStateMixin {
  bool femaleSelected = false;
  bool maleSelected = false;
  int age = 13;
  int height = 170;
  int weight = 60;
  late PageController controller;
  late TabController tabController;

  @override
  void initState() {
    controller = PageController();
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      child: Image.asset(
                        "Assets/TestProLogo.png",
                        height: 30,
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
                            child: Text("What is your gender?",style: TextStyle(fontSize: 24,),),
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
                                    setState(() {});
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
                                    setState(() {});
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
                    Container(
                      height: 500,
                      width: 500,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 500,
                      width: 500,
                      color: Colors.green,
                    ),
                    Container(
                      height: 500,
                      width: 500,
                      color: Colors.black,
                    ),
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: (() {
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

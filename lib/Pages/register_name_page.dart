import 'package:flutter/material.dart';

class NamePage extends StatelessWidget {
  NamePage({Key? key}) : super(key: key);

  String name = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your Name?",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const Flexible(
                          child: SizedBox(
                        height: 80,
                      )),
                      TextField(
                        onChanged: (value) => name = value,
                        decoration: const InputDecoration(hintText: "Your Name"),
                      ),
                      const Flexible(
                          child: SizedBox(
                        height: 100,
                      )),
                      
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:50,horizontal: 20),
                child: InkWell(
                        onTap: (() {
                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NamePage()));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

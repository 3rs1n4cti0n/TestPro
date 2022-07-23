import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      colors: [Colors.indigo[200]!, Colors.indigo[900]!],
                      end: Alignment.topLeft,
                      begin: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 3),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    )),
                width: double.infinity,
                height: 250,
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 180,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                "Welcome to TextPRO,\n${user!.displayName!}!",
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                            const Flexible(
                                child: SizedBox(
                              height: 10,
                            )),
                            const Expanded(child: SizedBox()),
                            Row(
                              children: [
                                const Expanded(child: SizedBox()),
                                TextButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.signOut();
                                      Navigator.pop(context);
                                    },
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "Sign out",
                                          style: TextStyle(
                                              color: Colors.purple[900]),
                                        ))),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  width: double.infinity,
                  height: 34,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 0.5)),
                  ),
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Information",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w100,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "age: 22",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          decoration: TextDecoration.none),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    const Text(
                      "height: 170",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          decoration: TextDecoration.none),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    const Text(
                      "weight: 80",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          decoration: TextDecoration.none),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

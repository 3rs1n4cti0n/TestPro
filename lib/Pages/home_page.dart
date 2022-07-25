import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/Utilities/fitness_app_user.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // pop to landing page
        await FirebaseAuth.instance.signOut().then((value) =>
            Navigator.of(context).popUntil((route) => route.isFirst));
        // no need for WillPopScope to pop
        return false;
      },
      child: SafeArea(
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
                                  "Welcome to TextPRO,\n${FirebaseAuth.instance.currentUser!.isAnonymous ? "Anonymous" : FitnessUser.name}!",
                                  overflow: TextOverflow.clip,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                              Text(
                                FirebaseAuth.instance.currentUser!.isAnonymous
                                    ? "Unknown"
                                    : FitnessUser.gender
                                        ? "male"
                                        : "female",
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.orange[800],
                                    decoration: TextDecoration.none),
                              ),
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
                              color: Colors.black.withOpacity(0.5),
                              width: 0.5)),
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
                      Text(
                        "age: ${FirebaseAuth.instance.currentUser!.isAnonymous ? "Unknown" : FitnessUser.age}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      Text(
                        "height: ${FirebaseAuth.instance.currentUser!.isAnonymous ? "Unknown" : FitnessUser.height}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      Text(
                        "weight: ${FirebaseAuth.instance.currentUser!.isAnonymous ? "Unknown" : FitnessUser.weight}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ],
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

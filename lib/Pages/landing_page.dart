import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 235, 235, 235),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          children: [
            Flexible(child: Image.asset("Assets/TestProLogo.png")),
            Text(
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
              style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.none,
                color: Colors.black,
                fontWeight: FontWeight.w100
              ),
            )
          ],
        ),
      ),
    );
  }
}

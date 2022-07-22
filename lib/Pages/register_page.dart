import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
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
                Expanded(child: SizedBox())
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 10,
                ),
              child: Container(color: Colors.red,height: double.infinity,width:double.infinity,
              )),
            )
          ],
        ),
      ),
    );
  }
}

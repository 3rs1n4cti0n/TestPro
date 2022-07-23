import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.account_circle),

          if(user?.isAnonymous != null && user?.isAnonymous == true)
          Text('Anonymous'),

          if(user?.isAnonymous == false)
          Text(user!.uid),

          TextButton(onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          }, child: Text("Sign out"))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_pro/Pages/home_page.dart';
import 'package:test_pro/Pages/register_page.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  User? user;

  Future<void> logInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {}
  }

  Future<void> logInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {
        }
      } catch (e) {
      }
    }
  }

  Future<void> logInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Material(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 200, 30, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: ShaderMask(
                      shaderCallback: ((bounds) {
                        return const LinearGradient(
                                colors: [Colors.black, Colors.green])
                            .createShader(bounds);
                      }),
                      blendMode: BlendMode.srcATop,
                      child: Image.asset(
                        "Assets/TestProLogo.png",
                        color: Colors.green,
                      ))),
              const Flexible(
                  child: SizedBox(
                height: 50,
              )),
              const Text(
                "Text Pro will help you improve your health day by day, by providing you with the right information you need.",
                style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              // place Holder
              InkWell(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                }),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 0, 5, 0),
                        child: Icon(
                          Icons.mail,
                          size: 45,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Continue with e-mail",
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (() async {
                  logInWithFacebook().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                              user: FirebaseAuth.instance.currentUser))));
                }),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Image.asset(
                          "Assets/FacebookLogo.png",
                          fit: BoxFit.contain,
                          width: 45,
                          height: 45,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Sign in with Facebook",
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await logInWithGoogle().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                              user: FirebaseAuth.instance.currentUser))));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Image.asset(
                          "Assets/GoogleLogo.png",
                          fit: BoxFit.contain,
                          width: 45,
                          height: 45,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Sign in with Google",
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () async {
                  await logInAnonymously().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                              user: FirebaseAuth.instance.currentUser))));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 50,
                      ),
                      Expanded(
                        child: Text(
                          "Continue Without Signing Up",
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
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

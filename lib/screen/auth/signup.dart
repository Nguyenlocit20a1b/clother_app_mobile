import 'package:clothing_shop/screen/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'reusable.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 125, 125, 125),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        title: const Text(
          "Login Now",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgroud.jpg"), fit: BoxFit.cover)),
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   hexStringToColor("CB2B93"),
        //   hexStringToColor("9546C4"),
        //   hexStringToColor("SE61F4"),
        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        'https://thumbs.dreamstime.com/b/zodiac-wheel-sign-leo-17429022.jpg')),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(" Email ", Icons.email_outlined, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(" Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

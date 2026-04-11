import 'package:flutter/material.dart';
import 'package:new_movie_app/screens/homepage.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/images/Logo1.jpg"),
                      ),
                    ],
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Log in to your account using emai or social networks",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset("assets/icons/apple.png"),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Login With Apple",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset("assets/icons/Google.png"),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Login With Google",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 1,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Or continue with social account",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 1,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text("Mobile Number"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off_outlined),
                        label: Text("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 30,
                        top: 10,
                        bottom: 15,
                      ),
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.indigoAccent),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                    child: Container(
                      width: 340,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text.rich(
                    TextSpan(
                      text: "Didn't have and account?",
                      children: [
                        TextSpan(
                          text: " Register",
                          style: TextStyle(color: Colors.indigoAccent),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

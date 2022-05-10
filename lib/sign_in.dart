import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/widget/costum_textfield.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';
import 'bottom_navigation_bar.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff3A8C6E),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Align(
                alignment: FractionalOffset(0.2, 0.6),
                child: SizedBox(
                  width: 260,
                  child: Text('Cari Bibit Berkualitas Bersama Metabit app',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 16)),
                ),
              ),
              Align(
                  alignment: const FractionalOffset(0.9, 0.1),
                  child: Image.asset(
                    'images/login.png',
                    scale: 0.8,
                  )),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(35))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 259),
                          child: Text(
                            "Masuk",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const CostumTextField(hintText: 'Email'),
                        const SizedBox(height: 30),
                        TextField(
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 15),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.visibility),
                              )),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 200),
                          child: Text("Lupa Password ?",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 13,
                                  color: Color(0xff8F8F8F))),
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNav()),
                            );
                          },
                          inputText: 'Sign In',
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SignUp();
                              }));
                            },
                            child: const Text("Or Sign Up Here",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 13,
                                    color: Color(0xff8F8F8F))))
                      ],
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/signup.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff3A8C6E),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 70, 50, 0),
              child: Text("Cari Bibit Berkualitas Bersama Metabit app",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(150, 0, 0, 50),
              child: Image.asset('images/login.png'),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(35))),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 270, 0),
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: TextField(
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 15),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 15),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Password',
                              suffixIcon: const Icon(Icons.visibility)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(250, 20, 0, 20),
                        child: Text("Lupa Password ?",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 13,
                                color: Color(0xff8F8F8F))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xff3A8C6E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return const Home();
                                })));
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
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
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign_in.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xff3A8C6E),
          body: Center(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 20),
                child: Text("Metabit App",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 25)),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('images/logo.jpeg'),
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Text("Hai, Selamat Datang !",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 20)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                    "Ayo Belanja dan Temukan Ribuan BiBit Pertanian Yang Berkualitas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  width: 70,
                  height: 40,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xff336452),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignIn();
                        }));
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )),
                ),
              )
            ]),
          ),
        ));
  }
}

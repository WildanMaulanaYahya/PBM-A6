import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff3A8C6E),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 60, 50, 0),
              child: Text(
                  "Temukan Penjualan Bibit Terbaik. Semua Bibit Berkualitass.",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(230, 10, 0, 30),
              child: Image.asset(
                'images/signup.png',
                scale: 1,
              ),
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
                        padding: EdgeInsets.fromLTRB(10, 20, 300, 10),
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 15),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Nama Lengkap',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 15),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'No Telepon',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 15),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 15),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Password',
                              suffixIcon: const Icon(Icons.visibility)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xff3A8C6E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              onPressed: () {},
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ubah_alamat.dart';

import 'editprofil_alamat.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff3A8C6E),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_outlined),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 80),
                    Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'images/profil.png',
                                width: 100,
                                height: 100,
                                color: const Color.fromARGB(208, 129, 129, 129),
                                colorBlendMode: BlendMode.modulate,
                              ),
                            ),
                            Positioned(
                              top: 30,
                              right: 25,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt_outlined),
                                color: Colors.white,
                                iconSize: 30,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 95,
                          height: 28,
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xffFCD857),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: "Popins",
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Name',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    SizedBox(width: 80),
                    Text(
                      'Wildan Maulana',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Username',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    SizedBox(width: 80),
                    Text(
                      'Wildan Provak',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Gender',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    SizedBox(width: 80),
                    Text(
                      'Male',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    SizedBox(width: 70),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilAlamat()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Alamat',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Jl. Mangga III No 17',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'No Hp',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    SizedBox(width: 40),
                    Text(
                      '081938785156',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    SizedBox(width: 50),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Email',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'wildan@gmail.com',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    SizedBox(width: 30),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

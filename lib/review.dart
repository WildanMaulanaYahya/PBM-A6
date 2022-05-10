import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color(0xff3A8C6E),
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    color: const Color(0xff3A8C6E),
                    child: SizedBox(
                      height: 100,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 680,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              const Text(
                                'Rp 50.000',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4F9E2A)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.star_rate,
                                    color: Color(0xffFFD233),
                                  ),
                                  Icon(
                                    Icons.star_rate,
                                    color: Color(0xffFFD233),
                                  ),
                                  Icon(
                                    Icons.star_rate,
                                    color: Color(0xffFFD233),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '3.0',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Divider(
                                color: Color(0xffABABAE),
                                thickness: 4,
                                indent: 30,
                                endIndent: 30,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'Comment',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(width: 30),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color(0xffC4C4C4),
                                        size: 5,
                                      ),
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color(0xffC4C4C4),
                                        size: 5,
                                      ),
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color(0xffC4C4C4),
                                        size: 5,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 30),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Image.asset("images/profil.png"),
                                      const SizedBox(width: 20),
                                      Column(
                                        children: [
                                          const Text(
                                            "Wildan Maulana",
                                            style: TextStyle(
                                                fontFamily: "poppins",
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.star_rate,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star_rate,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star_rate,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star_rate,
                                                color: Colors.yellow,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 100),
                                      const Icon(Icons.thumb_up_alt_outlined),
                                      const Icon(Icons.thumb_down_alt_outlined)
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 60),
                                    child: Text(
                                        "Dolor aliquam amet vitae vel at nunc nisl."),
                                  ),
                                  const SizedBox(height: 20),
                                  const Divider(
                                    color: Color(0xffE2E2E8),
                                    thickness: 4,
                                  ),
                                ],
                              )
                            ],
                          ))),
                  Positioned(
                    left: 150,
                    top: 70,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('images/biji4.png')),
                  ),
                ],
              ),
            )));
  }
}

import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              backgroundColor: const Color(0xff3A8C6E),
              body: Stack(
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
                              Expanded(
                                  child: ListView(
                                children: const [],
                              ))
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
              )),
        ));
  }
}

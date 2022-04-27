import 'package:flutter/material.dart';

class Abouttheapp extends StatelessWidget {
  const Abouttheapp({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              backgroundColor: const Color(0xff3A8C6E),
              body: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text("About The App",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 18)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 480,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Padding(
                        padding: EdgeInsets.all(50.0),
                        child: Text(
                          '''Lorem ipsum dolor sit amet, 
consectetur adipiscing elit ut 
aliquam, purus sit amet 
luctus venenatis, lectus 
magna fringilla urna, porttitor 
rhoncus dolor purus non 
enim praesent elementum 
facilisis leo, vel fringilla est 
ullamcorper eget nulla facilisi 
etiam dignissim diam quis 
enim lobortis scelerisque 
fermentum dui faucibus in 
ornare quam viverra orci 
sagittis eu volutpat odio 
facilisis mauris sit amet 
massa''',
                          style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const Text("Contacts",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "poppins",
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.mail_outlined),
                              Text(
                                "metabit@gmail.com",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.phone_outlined),
                              Text(
                                "080058947632",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}

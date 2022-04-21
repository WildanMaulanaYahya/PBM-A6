// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'add_to_cart.dart';

class Barang extends StatelessWidget {
  const Barang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(children: [
          Stack(
            children: [
              Image.asset(
                'images/biji4_pagebarang.png',
                scale: 0.1,
              ),
              Positioned(
                top: 30,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                  color: Colors.white,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Biji 4',
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Terjual 2.500',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          'Toko Arip',
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Rp 50.000',
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4f9E2A)),
                        ),
                        Row(
                          children: [
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
                            Text(
                              '3.0',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xffABABAE),
                  thickness: 4,
                  endIndent: 3,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra orci sagittis eu volutpat odio facilisis mauris sit amet massa''',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ]),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                color: Color(0xffFCD857),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Review',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(width: 30),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chat_bubble_outline)),
                        SizedBox(width: 30),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return AddtoCart();
                                  });
                            },
                            icon: Icon(Icons.shopping_cart_outlined)),
                        SizedBox(width: 30),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        color: Color(0xff3A8C6E),
                        width: 132,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Beli Sekarang',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}

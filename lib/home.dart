import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff3A8C6E),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset(
                        'images/filter.png',
                      ),
                      iconSize: 40,
                      onPressed: () {},
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: TextField(
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 12),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Ayo Cari Bibitmu',
                              prefixIcon: const Icon(Icons.search)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 30),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      height: 72,
                      width: 168,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '''Hallo Wildan, 
Mau Belanja Bibit Tanaman apa hari ini ? ''',
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Image.asset(
                        'images/home.png',
                        scale: 0.9,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: <Widget>[
                                  Image.asset('images/biji1.png'),
                                  const Text('Biji 1',
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                      )),
                                  const Text('Rp 50.000',
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff4F9E2A))),
                                  Row(
                                    children: const <Widget>[
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
                                        Icons.star_rate_outlined,
                                        color: Colors.yellow,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: <Widget>[
                                  Image.asset('images/biji2.png'),
                                  const Text('Biji 2',
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                      )),
                                  const Text('Rp 50.000',
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff4F9E2A))),
                                  Row(
                                    children: const <Widget>[
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
                                        Icons.star_rate_outlined,
                                        color: Colors.yellow,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: <Widget>[
                                  Image.asset('images/biji3.png'),
                                  const Text('Biji 3',
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                      )),
                                  const Text('Rp 50.000',
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff4F9E2A))),
                                  Row(children: const <Widget>[
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
                                    )
                                  ])
                                ],
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Divider(
                            color: Color(0xffABABAE),
                            thickness: 4,
                            indent: 30,
                            endIndent: 30,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: <Widget>[
                                Image.asset('images/biji4.png'),
                                const Text('Biji 4',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                    )),
                                const Text('Rp 50.000',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff4F9E2A))),
                                Row(
                                  children: const <Widget>[
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
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset('images/biji5.png'),
                                const Text('Biji 5',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                    )),
                                const Text('Rp 50.000',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff4F9E2A))),
                                Row(
                                  children: const <Widget>[
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
                                      Icons.star_rate_outlined,
                                      color: Colors.yellow,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset('images/biji6.png'),
                                const Text('Biji 6',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                    )),
                                const Text('Rp 50.000',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff4F9E2A))),
                                Row(
                                  children: const <Widget>[
                                    Icon(
                                      Icons.star_rate,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star_rate,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star_rate_outlined,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star_rate_outlined,
                                      color: Colors.yellow,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Divider(
                            color: Color(0xffABABAE),
                            thickness: 4,
                            indent: 30,
                            endIndent: 30,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
        bottomNavigationBar: Container(
            height: 60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {},
                  iconSize: 40,
                ),
                IconButton(
                    icon: const Icon(Icons.shopping_bag_rounded),
                    onPressed: () {},
                    iconSize: 40),
                IconButton(
                    icon: const Icon(Icons.account_circle),
                    onPressed: () {},
                    iconSize: 40)
              ],
            )),
      ),
    );
  }
}

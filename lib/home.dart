import 'package:flutter/material.dart';
import 'package:flutter_application_1/barang.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(appBarTheme: const AppBarTheme(color: Color(0xff3A8C6E))),
      home: Scaffold(
        backgroundColor: const Color(0xff3A8C6E),
        appBar: AppBar(
          toolbarHeight: 80,
          title: Container(
            width: double.infinity,
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
                child: TextField(
              style: const TextStyle(fontFamily: "Poppins", fontSize: 12),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.all(0),
                  hintText: 'Ayo Cari Bibitmu',
                  prefixIcon: const Icon(Icons.search)),
            )),
          ),
          elevation: 0.0,
          leading: Container(
            margin: const EdgeInsets.only(top: 6),
            child: Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {},
                  icon: Image.asset('images/filter.png'),
                );
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Image.asset('images/home.png')
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/biji1.png'),
                            ),
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
                        Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/biji2.png'),
                            ),
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
                        Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/biji3.png'),
                            ),
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
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Color(0xffABABAE),
                      thickness: 4,
                      indent: 30,
                      endIndent: 30,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Barang()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset('images/biji4.png')),
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
                        ),
                        Column(
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/biji5.png')),
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
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/biji6.png'),
                            ),
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Color(0xffABABAE),
                      thickness: 4,
                      indent: 30,
                      endIndent: 30,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/biji4.png')),
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
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/biji5.png')),
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
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/biji6.png'),
                            ),
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Color(0xffABABAE),
                      thickness: 4,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ],
                ),
              ),
            ],
            //  _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded),
              // activeIcon: Icon(Icons.select_all),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              // activeIcon: Icon(Icons.select_all),
              label: 'Profil',
            ),
          ],
          // currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          // onTap: _onItemTapped,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xff3A8C6E),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Image.asset(
                    'images/filter.png',
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    height: 30,
                    child: Text(
                      'Filter',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Kategori',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              GroupButton(
                options: GroupButtonOptions(
                    borderRadius: BorderRadius.circular(10),
                    selectedColor: const Color(0xffDADADA),
                    selectedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                    unselectedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                    mainGroupAlignment: MainGroupAlignment.start,
                    buttonWidth: 75,
                    buttonHeight: 25,
                    elevation: 8),
                maxSelected: 1,
                isRadio: false,
                buttons: const ["Bunga", "Sayuran", "Buah", "Tanaman"],
              ),
              const SizedBox(height: 20),
              const Text(
                'Rating',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              GroupButton(
                options: GroupButtonOptions(
                    borderRadius: BorderRadius.circular(10),
                    selectedColor: const Color(0xffDADADA),
                    selectedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                    unselectedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                    mainGroupAlignment: MainGroupAlignment.start,
                    buttonWidth: 75,
                    buttonHeight: 25,
                    runSpacing: 20,
                    elevation: 8),
                maxSelected: 1,
                isRadio: false,
                buttons: const [
                  "Bintang 1",
                  "Bintang 2",
                  "Bintang 3",
                  "Bintang 4",
                  "Bintang 5"
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Rentang Harga',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              GroupButton(
                options: GroupButtonOptions(
                    borderRadius: BorderRadius.circular(10),
                    selectedColor: const Color(0xffDADADA),
                    selectedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                    unselectedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                    mainGroupAlignment: MainGroupAlignment.start,
                    runSpacing: 10,
                    elevation: 8),
                maxSelected: 1,
                isRadio: false,
                buttons: const [
                  "0 - 50.000",
                  "50.000 - 75.000",
                  "0 - 100.000",
                ],
              ),
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Text(
                        "Reset",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontSize: 12),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Text(
                        "Apply",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontSize: 12),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

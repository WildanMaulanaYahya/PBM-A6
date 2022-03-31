import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NewWidget();
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold ( backgroundColor: const Color(0xff3A8C6E),
        body: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 100, 10, 10),
                child: ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset('images/profil.png'
                  ,width: 100,
                  height: 100,
                  
                  ),
                ) 
                         
     
      
    ),
              ],
            // ignore: prefer_const_literals_to_create_immutables
            ),Column(children: [
              const Text("tes 1223"),
              const Padding(padding:EdgeInsets.fromLTRB(100, 500, 100, 500) )
            
            ],)
          ],
        )
    )
    );


    
  }
}
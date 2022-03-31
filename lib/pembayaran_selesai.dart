import 'package:flutter/material.dart';

void main() 
{
  runApp( const MyApp());
}

class MyApp  extends StatelessWidget {
  const MyApp ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: Scaffold(backgroundColor: Color(0xff3A8C6E),
        body:  SafeArea (child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Proses Pembayaran Selesai",
                style:TextStyle(fontFamily:" Poopins",
                fontWeight: FontWeight.bold, 
                fontSize:30,
                color:Colors.white),
                ),
              ), Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Kembali Ke Home",
                style:TextStyle(fontFamily:" Poopins",
                fontWeight: FontWeight.bold,  
                fontSize:28,
                color:Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Image(image: AssetImage('images/cartsukses.png')
                ),
              )],
              
        ),
      ),
      
      
    )));
  }
}
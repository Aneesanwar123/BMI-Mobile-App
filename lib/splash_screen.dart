import 'package:flutter/material.dart';
import 'package:my_app/login.dart';
class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds:2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
    return Scaffold(
      body:Container(
        color: Colors.deepPurple[400],
        child: Center(child: Image.asset("images/logo.png")),
      )
    );
  }
}

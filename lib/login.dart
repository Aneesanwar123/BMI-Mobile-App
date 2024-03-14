import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/forgot.dart';
import 'register.dart';
import 'body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  bool obsecure = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "" || password == ""){
      log("User not found");
    }
    else{
      log("Login Succedded");
      try{
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password
        );
        if(userCredential.user!=null){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>body()));
        }
      }on FirebaseAuthException catch(er){
        log(er.code.toString());
      }
    }
  }
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 55,),
                Image.asset(
                  "images/logo.png",
                  fit: BoxFit.cover,
                  height: 160,
                  width: 250,
                ),
                SizedBox(height: 40,),
                Text(
                  "Hi, Welcome back!",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Text(
                  "Sign In to continue",
                  style: GoogleFonts.montserrat(
                   textStyle: TextStyle(
                     color: Colors.white,
                     fontSize: 17,
                   )
                  )
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 3,),
                      Container(
                        height: 50,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white70,
                            width: 1
                          )
                        ),
                        child: TextFormField(
                          controller: emailController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Please Enter an Email";
                            }
                            else if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                .hasMatch(text)) {
                              return "Invalid email format";
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.alternate_email,
                              color: Colors.white,),
                            // filled: true,
                            label:Text("Email"),
                            labelStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                              )
                            ),
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      // SizedBox(height: 3),
                      Container(
                        height: 50,
                        width: 330,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                            color: Colors.white70,
                            width: 1
                          )
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: obsecure,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Password Is empty";
                            } else if (text.length < 6) {
                              return "Password Should Be Above 6 Characters";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            label:Text("Password"),
                            labelStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                              ),
                            ),
                            prefixIcon: Icon(
                                Icons.lock_open_outlined,
                                color: Colors.white),
                            fillColor: Colors.white,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obsecure = !obsecure;
                                });

                              },
                              child: Icon(obsecure ? Icons.visibility:Icons.visibility_off,
                                color: Colors.white,
                              ),
                            ),
                            floatingLabelStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>forgot()));
                          },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 12
                              ),
                              child: Text(
                                "Forgot password?",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ),
                            ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      login();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>body()));
                  }
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                       ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
                const SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an Account?",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => register()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(
                          "Signup",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: 80,
                  color: Colors.indigo[600],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

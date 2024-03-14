import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/utils.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {

  final EmailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool isEmailSent =  false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: null,
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    "Forgot Password?",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                        "Enter The Gmail Associated with your account",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            )
                        ),
                      textAlign:TextAlign.center ,
                    ),
                  SizedBox(height: 40,),
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
                      controller: EmailController,
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
                        hintText: "Email",
                        hintStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),
                        ),
                        prefixIcon: Icon(
                            Icons.alternate_email,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(onPressed: () {
                    auth.sendPasswordResetEmail(
                      email: EmailController.text.toString(),
                    ).then((value) {
                      Utils().toastmessage("We have Sent You Email to recover Password,Please check Your Email");
                    }).onError((error, stackTrace) {
                      Utils().toastmessage(error.toString());
                    });
                  },
                      child: Text(
                          "forgot",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
                ],
              ),
            ),
          ),
        ),
    );
  }
}

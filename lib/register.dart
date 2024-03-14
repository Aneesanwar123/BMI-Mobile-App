import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_app/utils.dart';
class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  // bool loading =  true;

  final _formkey = GlobalKey<FormState>();
  final fullnameController =  TextEditingController();
  final emailController =  TextEditingController();
  final MobileController =  TextEditingController();
  final DevKeyController =  TextEditingController();
  final DevurlController =  TextEditingController();
  final PasswordController =  TextEditingController();
  final confpassController =  TextEditingController();

  final database = FirebaseDatabase.instance.ref("user");
  void Createacc() async {
    String email = emailController.text.trim();
    String password = PasswordController.text.trim();
    String Mobile = emailController.text.trim();
    String Devkey = DevKeyController.text.trim();
    String Devurl = DevurlController.text.trim();
    String Password = PasswordController.text.trim();
    String confompasssowrd = confpassController.text.trim();

    if(email == "" || password == "" || Mobile == "" || Devkey == "" || Devurl == "" || Password == "" || confompasssowrd == ""){
      print(" Please fill all the Details");
    }
    else{
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user!=null){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }else{
        }
        print("User created");
      }
      on FirebaseException catch (e) {
        print(e.code.toString());
      }
    }
  }

  @override
  void dispose(){
    super.dispose();
    fullnameController.dispose();
    emailController.dispose();
    MobileController.dispose();
    DevKeyController.dispose();
    DevurlController.dispose();
    PasswordController.dispose();
    confpassController.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: null,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 65,),
              Image.asset("images/logo.png",
                fit: BoxFit.cover,
                height: 120,
                width: 200,
              ),
              SizedBox(height: 20,),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 330,
                      child: TextFormField(
                        controller: fullnameController,
                        // validator: (Text){
                        //   if (Text == Null || Text!.isEmpty){
                        //      return "Full Name IS Empty";
                        //   }
                        // },
                        decoration: InputDecoration(
                          hintText:"Your Full name",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      ),
                    ),
                    SizedBox(height: 13,),
                    Container(
                      height: 50,
                      width: 330,
                      child: TextFormField(
                        controller: emailController,
                        validator: (Text){
                          if (Text == Null || Text!.isEmpty){
                            return "Email is Empty";
                          }
                          else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                              .hasMatch(Text)) {
                            return "Invalid email format";
                          }
                        },
                        decoration: InputDecoration(
                          hintText:"Email",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      ),
                    ),
                    SizedBox(height: 13,),
                    Container(
                      height: 50,
                      width: 330,
                      child: TextFormField(
                        controller: MobileController,
                        //    validator: (Text){
                        //        if (Text == Null || Text!.isEmpty){
                        //       return "Mobile IS Empty";
                        //    }
                        //    return null;
                        // },
                        decoration: InputDecoration(
                          hintText:"Mobile",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      ),
                    ),
                    SizedBox(height: 13,),
                    Container(
                      height: 50,
                      width: 330,
                      child: TextFormField(
                        controller: DevKeyController,
                        // validator: (Text){
                        //   if (Text == Null || Text!.isEmpty){
                        //     return "Device Key IS Empty";
                        //   }
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          hintText:"device Key",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      ),
                    ),
                    SizedBox(height: 13),
                    Container(
                      height: 50,
                      width: 330,
                      child: TextFormField(
                        controller: DevurlController,
                        // validator: (Text){
                        //   if (Text == Null || Text!.isEmpty){
                        //     return "Device Url Is Empty";
                        //   }
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          hintText:"Device Url",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      ),
                    ),
                    SizedBox(height: 13),
                    Container(
                      height: 50,
                      width: 330,
                      child: TextFormField(
                        controller: PasswordController,
                           // validator: (Text){
                           //    if (Text == Null || Text!.isEmpty){
                           //           return "Password Is Empty";
                           //      }
                           //    return null;
                           //    },
                         decoration: InputDecoration(
                          hintText:"Password",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      ),
                    ),
                    SizedBox(height: 13),
                    Container(
                      height: 50,
                      width: 330,
                      child: TextFormField(
                        controller: confpassController,
                        // validator: (Text){
                        //   if (Text == Null || Text!.isEmpty){
                        //     return "Confirm Password IS Empty";
                        //   }
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          hintText:"Confirm Password",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      ),
                    ),
                    SizedBox(height: 13),
                    ElevatedButton(
                      onPressed: () {
                        Createacc();
                        database.child("user").push().set({
                          'name': fullnameController.text,
                          'email': emailController.text,
                          'Mobile': MobileController.text,
                          'devkey': DevKeyController.text,
                          'devurl': DevurlController.text,
                          'password': PasswordController.text,
                          'confirmpassword': confpassController.text,
                        }).then((value) {
                          Utils().toastmessage("Data Added");
                        }).onError((error, stackTrace) {
                          Utils().toastmessage(error.toString());
                        });
                       },
                      child: Text("Signup",style: TextStyle(
                          color: Colors.black
                      ),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Set button background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Set button border radius
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

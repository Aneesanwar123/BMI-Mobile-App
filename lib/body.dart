import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_app/fetch.dart';
import 'package:percent_indicator/percent_indicator.dart';

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {

  final database = FirebaseDatabase.instance.ref("Analytics");

  var MinController  = TextEditingController();
  var MaxController  = TextEditingController();
  var result  = "";

  double calculatePercentage() {
    var minValue = double.tryParse(MinController.text) ?? 0.0;
    var maxValue = double.tryParse(MaxController.text) ?? 100.0;
    var value = minValue.clamp(0.0, maxValue);
    return value / maxValue;
  }

  Color getProgressColor() {
    double percentage = calculatePercentage() * 100;
    if (percentage < 50) {
      return Colors.indigo; // Set color to green if percentage is less than 50%
    } else if (percentage < 80) {
      return Colors.pinkAccent; // Set color to yellow if percentage is less than 80%
    } else {
      return Colors.red; // Set color to red for higher percentages
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/values.jpeg"),
                  ),
                ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: IconButton(onPressed: () {},
                     icon: Icon(Icons.menu,size: 28,),color: Colors.white,),
               )
              ],
            ),
            SizedBox(height: 30,),
            Text("Your Tank Level",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              )
            ),
            SizedBox(height: 20,),
            Center(
              child: CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 12.0,
                percent: 0.79,
                animation: true,
                animationDuration: 200,
                center: Text(
                  result.isEmpty ? "0%" : result, // Show result message if not empty
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.white
                    ),
                  ),
                ),
                progressColor: getProgressColor(),
              ),
            ),
            SizedBox(height: 70,),
            Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        child: TextFormField(
                          controller: MinController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            hintText: "Min Value",
                            // labelText: "Min Value",
                            fillColor: Colors.white,
                            filled: true
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        height: 50,
                        width: 150,
                        child: TextFormField(
                          controller: MaxController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              hintText: "Max Value",
                              // labelText: "Max Value",
                              fillColor: Colors.white,
                              filled: true
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            SizedBox(height: 40),
            Container(
              height: 60,
              width: 200,
              child: ElevatedButton(onPressed: (
                  ) {

                Navigator.push(context, MaterialPageRoute(builder: (context)=>FetchData()));
                var Minvalue = MinController.text.toString();
                var Maxvalue = MaxController.text.toString();

                if(Minvalue.isEmpty && Maxvalue.isEmpty){
                  print("Please Fill All The Required fields");
                }else if (int.parse(Maxvalue) > int.parse(Minvalue)){
                  var minvalue = int.parse(Minvalue);
                  var maxvalue = int.parse(Maxvalue);
                  setState(() {
                    var MinValue = int.parse(Minvalue);
                    var MaxValue = int.parse(Maxvalue);
                    result = "Min: $MinValue, Max: $MaxValue";
                    database.child("Analytics").push().set(
                        {
                          database.push().set({
                            "Min Value" : MinController.text,
                            "Max Value" : MaxController.text,
                          }).then((value) {
                            setState(() {
                              print("Data Stored Successfully");
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              print("Error");
                            });
                          })
                        }
                    );
                    // Update result with input field values
                  });
                }
                else{
                   print("The Max Value Should Be greater Then Min value");
                }
                // Text("Please Fill All The Required fields");
              } ,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.black
                  ),
                  child: Text(
                      "Set Value",
                    style:TextStyle(
                      fontSize: 20,
                    ),
                  )
              ),
            ),
            SizedBox(height: 20,),
            Text(
              result,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              ),
            )
          ],
        
        ),
      ),

    );
  }
}
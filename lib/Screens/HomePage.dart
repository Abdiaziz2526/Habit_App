import 'package:flutter/material.dart';
import 'package:habbit_app/Screens/BottomNavigator.dart';
import 'package:habbit_app/Screens/Screen.dart';
import 'package:habbit_app/Widgets/app_large_text.dart';
import 'package:habbit_app/Widgets/app_text.dart';
import 'package:lottie/lottie.dart'; // Import the Lottie package
import 'package:habbit_app/Widgets/app_Colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: AppLargeText(text: 'Habit', color: AppColors.primary),
        centerTitle: true,
      ),
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/9d957bcc-a19f-4cd8-8eae-6a7d1cc11182/jZ3pJX4VYW.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
 

Padding(
  padding: const EdgeInsets.all(20),
  child: Container(
    
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           AppLargeText(
    text: 'Welcome',
    color: Colors.black,
  ),

          Text(
            "Success is the sum of small efforts, repeated day in and day out.",
           
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          
          Text(
            "Every day is a new opportunity to improve",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
         
          Text(
            "Take it one step at a time and stay consistent.",
           
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
             color: Colors.black,
            ),
          ),
          SizedBox(height: 30),
          Container(
  height: 60,
  width: 250,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeBottom()),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0, // Shadow effect
      padding: EdgeInsets.symmetric(vertical: 15),
    ),
    child: AppText(
      text: "Get started",
      color: Colors.white,
      size: 20,
    ),
  ),
),
        ],
      ),
      
  ),
  
),

 // Increased space before the button


          ],
        ),
      ),
    );
  }
}

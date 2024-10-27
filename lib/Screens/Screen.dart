import 'package:flutter/material.dart';
import 'package:habbit_app/Widgets/app_Colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:habbit_app/Widgets/app_text.dart';
import 'package:iconly/iconly.dart'; // Import Fluent UI Icons

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.1,
                      blurRadius: 0.1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    // Action to perform when the button is pressed
                  },
                  icon: Icon(Icons.menu),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                 boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.1,
                      blurRadius: 0.1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(IconlyLight.notification),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
            ],
          ),
          SizedBox(height: 17),
          Container(
            height: 120,
            width: 370,
            decoration: BoxDecoration(
              color: AppColors.primary,
              image: DecorationImage(image: AssetImage("assets/bggg-01.jpg"),
              fit: BoxFit.cover
              ),
             
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0.1,
                  blurRadius: 0.2,
                  offset: Offset(1, 1),
                ),
                
              ],
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(right: 280),
            child: AppText(text: 'Category', size: 18),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.work),
                    ),
                  ),
                  SizedBox(height: 4),
                  AppText(text: "Work", size: 16),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.profile),
                    ),
                  ),
                  SizedBox(height: 4),
                  AppText(text: "Personal", size: 16),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.heart),
                    ),
                  ),
                  SizedBox(height: 4),
                  AppText(text: "Health", size: 16),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.show),
                    ),
                  ),
                  SizedBox(height: 4),
                  AppText(text: "Plan", size: 16),
                ],
              ),
            ],
          ),
          SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.only(right: 230),
            child: AppText(text: 'Your daily tasks', size: 18),
          ),
          SizedBox(height: 12),
          // Sample Habit Card
          Container(
            height: 120,
            width: 360,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text for Habit Title and Description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Exercise",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "30 minutes of cardio every day",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // Update and Delete Icons
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        IconlyLight.edit,
                         color: Colors.white,
                      ),
                      onPressed: () {
                        // Handle update action
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconlyLight.delete,
                        color: Colors.white,
                        
                     
                      ),
                      onPressed: () {
                        // Handle delete action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12,),
           Container(
            height: 120,
            width: 360,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text for Habit Title and Description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Exercise",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "30 minutes of cardio every day",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // Update and Delete Icons
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        IconlyLight.edit,
                         color: Colors.white,
                      ),
                      onPressed: () {
                        // Handle update action
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconlyLight.delete,
                        color: Colors.white,
                        
                     
                      ),
                      onPressed: () {
                        // Handle delete action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

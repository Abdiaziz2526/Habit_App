import 'package:flutter/material.dart';
import 'package:habbit_app/Models/staticsModel.dart';
import 'package:habbit_app/Widgets/app_Colors.dart';
import 'package:habbit_app/Widgets/app_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StaticsScreen extends StatelessWidget {
  StaticsScreen({super.key});

  final List<Habit> habits = [
    Habit("Exercise", "30 minutes of cardio", DateTime.now().subtract(Duration(days: 1)), 0.75, DateTime.now().subtract(Duration(days: 1))),
    Habit("Reading", "Read 20 pages of a book", DateTime.now().subtract(Duration(days: 2)), 0.60),
    Habit("Meditation", "Meditated for 15 minutes", DateTime.now().subtract(Duration(days: 3)), 0.90, DateTime.now().subtract(Duration(days: 3))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: Text("Statistics"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           AppText(text: 'Your Progress',color: Colors.black, size: 20,),
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 0.5, offset: const Offset(0, 0)),
                  ],
                ),
                child: Center(
                  child: Text(
                    "75%", // Replace with dynamic value based on overall progress
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
           AppText(text: 'Habit Breakdown',color: Colors.black, size: 20,),
            const SizedBox(height: 10),
            _buildHabitBreakdownChart(),
            const SizedBox(height: 20),
            AppText(text: 'Recent Activity',color: Colors.black, size: 20,),
            const SizedBox(height: 10),
            ...habits.where((habit) => habit.completionDate != null).map((habit) => _buildRecentActivityItem("${habit.title} completed on ${habit.completionDate!.toLocal()}")),
          ],
        ),
      ),
    );
  }

  Widget _buildHabitBreakdownChart() {
    return Container(
      height: 250,
      child: SfCircularChart(
        series: <CircularSeries>[
          PieSeries<HabitData, String>(
            dataSource: habits.map((habit) => HabitData(habit.title, habit.completion)).toList(),
            xValueMapper: (HabitData habitData, _) => habitData.title,
            yValueMapper: (HabitData habitData, _) => habitData.completion * 100, // Convert to percentage
            dataLabelMapper: (HabitData habitData, _) => '${habitData.title}: ${habitData.completion * 100}%',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          )
        ],
      ),
    );
  }

  Widget _buildRecentActivityItem(String activity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(activity, style: TextStyle(color: Colors.white)),
    );
  }
}

class HabitData {
  final String title;
  final double completion;

  HabitData(this.title, this.completion);
}

import 'package:flutter/material.dart';
import 'package:habbit_app/Models/habitModel.dart';
import 'package:habbit_app/Screens/habits/services/habit_Services.dart';
import 'package:habbit_app/Widgets/app_Colors.dart';
import 'package:iconly/iconly.dart';
import 'add_habit.dart';
import 'package:intl/intl.dart';

class HomeHabit extends StatefulWidget {
  const HomeHabit({Key? key}) : super(key: key);

  @override
  _HomeHabitState createState() => _HomeHabitState();
}

class _HomeHabitState extends State<HomeHabit> {
  List<Habit> habitsList = [];
  final HabitServices _habitServices = HabitServices();

  @override
  void initState() {
    super.initState();
    readAllHabits();
  }

  void readAllHabits() async {
    try {
      List<Habit> fetchedHabits = await _habitServices.getAllHabits();
      if (mounted) {
        setState(() {
          habitsList = fetchedHabits;
        });
      }
    } catch (error) {
      print('Error fetching habits: $error');
    }
  }

  void deleteHabit(String id) async {
    try {
      if (id.isEmpty) {
        throw Exception('Invalid ID: Cannot be empty');
      }

      await _habitServices.deleteHabit(id);
      setState(() {
        habitsList
            .removeWhere((habit) => habit.id == id); // Remove from local list
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Habit deleted successfully!')),
      );
    } catch (error) {
      print('Error deleting habit: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting habit: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text("My Habits"),
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        automaticallyImplyLeading: false,
      ),
      body: habitsList.isEmpty
          ? Center(child: Text('No habits added yet!'))
          : ListView.builder(
              itemCount: habitsList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  width: 360,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            habitsList[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            habitsList[index].description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            DateFormat.yMMMd().format(habitsList[index].date),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(IconlyLight.edit, color: Colors.white,),
                            onPressed: () {
                              // Handle update action
                            },
                          ),
                          IconButton(
                            icon: Icon(IconlyLight.delete, color: Colors.white,),
                            onPressed: () async {
                              try {
                                await _habitServices.deleteHabit(
                                    habitsList[index]
                                        .id); // Ensure this ID is valid
                                readAllHabits(); // Refresh the habit list
                              } catch (error) {
                                print('Error: $error'); // Log any errors
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Habit? newHabit = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHabit()),
          );

          if (newHabit != null) {
            readAllHabits(); // Refresh the habit list
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}

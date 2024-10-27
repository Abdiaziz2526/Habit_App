import 'dart:convert';
import 'package:habbit_app/Models/habitModel.dart';
import 'package:http/http.dart' as http;

class HabitServices {
  final String baseUrl = 'https://backend-habbitapp.onrender.com/api/habits';

  Future<Habit?> addHabit(String title, String description) async {
    if (title.isEmpty || description.isEmpty) {
      throw Exception('Title and description cannot be empty');
    }

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'description': description,
          'date': DateTime.now().toIso8601String(), // Include the date
        }),
      );

      if (response.statusCode == 201) {
        return Habit.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create habit: ${response.body}');
      }
    } catch (error) {
      throw Exception('Error creating habit: $error');
    }
  }

  Future<List<Habit>> getAllHabits() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((habit) => Habit.fromJson(habit)).toList().cast<Habit>();
      } else {
        throw Exception('Failed to fetch habits');
      }
    } catch (error) {
      throw Exception('Error fetching habits: $error');
    }
  }

  Future<Habit?> updateHabit(String id, String title, String description) async {
    if (title.isEmpty || description.isEmpty) {
      throw Exception('Title and description cannot be empty');
    }

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'description': description,
          'date': DateTime.now().toIso8601String(), // Update the date if needed
        }),
      );

      if (response.statusCode == 200) {
        return Habit.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to update habit: ${response.body}');
      }
    } catch (error) {
      throw Exception('Error updating habit: $error');
    }
  }

Future<void> deleteHabit(String id) async {
  id = id.trim(); // Trim whitespace
  final response = await http.delete(Uri.parse('$baseUrl/$id'));

  if (response.statusCode == 204) {
    print('Habit deleted successfully');
  } else {
    throw Exception('Failed to delete habit: ${response.body}');
  }
}



}

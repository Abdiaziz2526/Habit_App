// lib/models/habit.dart
class Habit {
  final String title;
  final String description;
  final DateTime createdDate;
  final double completion;
  DateTime? completionDate;

  Habit(this.title, this.description, this.createdDate, this.completion, [this.completionDate]);

  String? get id => null;

  get date => null;

  static Future<Habit?> fromJson(jsonDecode) async {}
}

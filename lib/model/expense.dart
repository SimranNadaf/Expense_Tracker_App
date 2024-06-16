import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

var uuid = const Uuid();
var formater = DateFormat.yMd();

enum Category { food, work, travel, leisure }

const categoryIcon = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.train,
  Category.leisure: Icons.movie,
  Category.work: Icons.laptop,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formater.format(date);
  }
}

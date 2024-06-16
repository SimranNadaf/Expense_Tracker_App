import 'package:expense_app/expensesList.dart';
import 'package:expense_app/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  @override
  State<Expenses> createState() {
    return ExpensesState();
  }
}

class ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Vegitables",
        amount: 120,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Course",
        amount: 549,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Going Home",
        amount: 800.5,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: "birthday",
        amount: 800.5,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _showAddExpenseModal() {
    showModalBottomSheet(
        context: context, builder: (cxt) => const Text("Add Expense"));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _showAddExpenseModal,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            child: ExpenseList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}

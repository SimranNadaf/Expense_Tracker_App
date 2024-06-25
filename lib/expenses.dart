import 'package:expense_app/expensesList.dart';
import 'package:expense_app/model/expense.dart';
import 'package:expense_app/newExpense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
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
      context: context,
      builder: (cxt) => NewExpense(onAddExpense: addExpense),
      isScrollControlled: true,
    );
  }

  void _removeExpense(Expense expense) {
    var indexExpense = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(indexExpense, expense);
              });
            }),
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(context) {
    Widget content =
        const Center(child: Text("Expenses Not Found. Try to add some new!"));
    if (_registeredExpenses.isNotEmpty) {
      setState(() {
        content = ExpenseList(
          expenses: _registeredExpenses,
          onRemoveExpense: _removeExpense,
        );
      });
    }
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
            child: content,
          ),
        ],
      ),
    );
  }
}

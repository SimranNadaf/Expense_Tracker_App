import 'package:expense_app/expenseItem.dart';
import 'package:expense_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          expenses[index],
        ),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.750),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}

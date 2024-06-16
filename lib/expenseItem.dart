import 'package:expense_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            Text(expense.title),
            Row(
              children: [
                Text(
                  '\u{20B9}${expense.amount.toString()}',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcon[expense.category],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      expense.formatedDate,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:expense_app/model/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  final _textController = TextEditingController();
  final _amountController = TextEditingController();

  _datePicker() async {
    DateTime now = DateTime.now();
    DateTime first = DateTime(now.year - 1, now.month, now.day);
    _selectedDate =
        await showDatePicker(context: context, firstDate: first, lastDate: now);
    setState(() {
      _selectedDate;
    });
  }

  _submitExpense() {
    var enteredAmount = double.tryParse(_amountController.text);
    var enteredAmountvalid = enteredAmount == null || enteredAmount <= 0;
    if (_textController.text.trim().isEmpty ||
        enteredAmountvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text(
              "Please Enter valid title, amount, date and category type."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okey"),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
        title: _textController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _textController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _textController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text(
                "Title",
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\u{20B9} ',
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Not Select Date"
                          : formater.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _datePicker,
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 46,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: _submitExpense,
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

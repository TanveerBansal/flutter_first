import 'package:flutter/material.dart';
import 'package:first_app/models/expense.dart';
import 'package:first_app/widgets/expensesLists/expense_items.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    //here ListView.builder is used, because it only render the list data which vivsivle to sceen, not like normal listview taht render the whole data when the class is called.
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) =>
          // NOTE: Dismissible is widget that is used to create swipe-to-dismiss functionality,
          Dismissible(
            key: ValueKey(expenses[index]),
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              // margin: EdgeInsets.symmetric(
              //   horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              // ),
              alignment: Alignment.centerLeft, // Align icon to right side
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Theme.of(context).colorScheme.error,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment
                  .centerRight, // Icon on right for right-to-left swipe
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItems(expenses[index]),
          ),
    );
  }
}

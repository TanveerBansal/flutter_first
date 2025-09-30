// import 'package:first_app/_shopping_list_app/data/dummy_items.dart';
import 'package:first_app/_shopping_list_app/models/grocery_item.dart';
import 'package:first_app/_shopping_list_app/widgets/new_item.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItemNavigate() async {
    final newItem = await Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );
    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void _handleRemove(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No item added yet!'));
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(_groceryItems[index].quantity.toString()),
          ),
          onDismissed: (direction) {
            _handleRemove(_groceryItems[index]);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(onPressed: _addItemNavigate, icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}

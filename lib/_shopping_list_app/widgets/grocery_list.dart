import 'dart:convert';

import 'package:first_app/_shopping_list_app/data/categories.dart';
import 'package:http/http.dart' as http;
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
  var _groceryItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  void _fetchItems() async {
    final url = Uri.https(
      'flutter-5d86d-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );
    try {
      final response = await http.get(url);
      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
          _groceryItems = [];
        });
        return;
      }
      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Something wrong, Please try later!';
        });
      }
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedList = json.decode(response.body);
        final formatedList = [];
        for (final item in decodedList.entries) {
          final cat = categories.entries
              .firstWhere(
                (catItem) => catItem.value.title == item.value['category'],
              )
              .value;

          formatedList.add(
            GroceryItem(
              id: item.key,
              name: item.value['name'],
              quantity: item.value['quantity'],
              category: cat,
            ),
          );
        }

        setState(() {
          _groceryItems = formatedList;
          _isLoading = false;
        });
      }
    } catch (err) {
      setState(() {
        _error = 'Something went wrong!';
        _isLoading = false;
      });
    }
  }

  void _addItemNavigate() async {
    // final newItem = await Navigator.push<GroceryItem>(
    //   context,
    //   MaterialPageRoute(builder: (ctx) => const NewItem()),
    // );
    // if (newItem != null) {
    //   setState(() {
    //     _groceryItems.add(newItem);
    //   });
    // }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );
    _fetchItems();
  }

  void _handleRemove(GroceryItem item) async {
    final url = Uri.https(
      'flutter-5d86d-default-rtdb.firebaseio.com',
      'shopping-list/${item.id}.json',
    );
    await http.delete(url, headers: {'Content-Type': 'application/json'});

    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No item added yet!'));
    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }
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

    if (_error != null) {
      content = Center(child: Text(_error!));
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

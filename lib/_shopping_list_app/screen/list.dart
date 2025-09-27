import 'package:flutter/material.dart';

class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: const Text('Your Groceries')),
      body: const Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.check_box_outline_blank, color: Colors.amber, fill: 1),
              Text('Milk'),
              SizedBox(width: 330),
              Text('1'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.check_box_outline_blank, color: Colors.amber, fill: 1),
              Text('Banana'),
              SizedBox(width: 300),
              Text('5'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.check_box_outline_blank, color: Colors.amber, fill: 1),
              Text('fruit'),
              SizedBox(width: 330),
              Text('1'),
            ],
          ),
        ],
      ),
    ));
  }
}

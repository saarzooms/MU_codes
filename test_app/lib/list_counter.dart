import 'package:flutter/material.dart';

class ListCounter extends StatefulWidget {
  const ListCounter({super.key});

  @override
  State<ListCounter> createState() => _ListCounterState();
}

class _ListCounterState extends State<ListCounter> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dynamic List Tile'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    count++;
                    setState(() {});
                  },
                  child: Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    count = 0;
                    setState(() {});
                  },
                  child: Icon(Icons.restart_alt),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (count > 0) {
                      count--;
                      setState(() {});
                    }
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < count; i++)
                    ListTile(
                      leading: Icon(Icons.shopping_bag),
                      title: Text('item ${i + 1}'),
                      subtitle: Text('Sub ${i + 1}'),
                    )
                ],
              ),
            )
          ],
        ));
  }
}

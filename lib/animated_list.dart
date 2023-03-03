import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreen();
}

class _AnimatedListScreen extends State<AnimatedListScreen> {
  final items = [];

  final GlobalKey<AnimatedListState> key = GlobalKey();

  void addItem() {
    items.insert(0, "Item ${items.length + 1}");
    key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _removeItem(int index) {
    key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          elevation: 10,
          color: Colors.purple,
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
            title: Text("Deleted", style: TextStyle(fontSize: 24)),
          ),
        ),
      );
    }, duration: const Duration(seconds: 1));

    items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Flutter Mapp'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height / 30,
          ),
          FloatingActionButton(
            backgroundColor: Colors.purple[200],
            onPressed: addItem,
            child: const Icon(Icons.add),
          ),
          Expanded(
            child: AnimatedList(
              key: key,
              initialItemCount: 0,
              padding: const EdgeInsets.all(10),
              itemBuilder: (_, index, animation) {
                return SizeTransition(
                  key: UniqueKey(),
                  sizeFactor: animation,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 10,
                    color: Colors.amber[800],
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(15),
                      title: Text(items[index],
                          style: const TextStyle(
                              fontSize: 24, color: Colors.white)),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeItem(index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

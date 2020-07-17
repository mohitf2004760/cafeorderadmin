import 'package:flutter/material.dart';

class SwipeItemsList  extends StatefulWidget {
  //ItemsList({Key key}) : super(key: key);
  @override
  _SwipeItemsListState createState() => _SwipeItemsListState();
}

class _SwipeItemsListState extends State<SwipeItemsList> {
  final _items = List<String>.generate(20, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body:ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        //return ListTile(title: Text('${items[index]}'));
        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: UniqueKey(),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              _items.removeAt(index);
            });

            // Show a snackbar. This snackbar could also contain "Undo" actions.
            Scaffold
                .of(context)
                .showSnackBar(SnackBar(content: Text("$item dismissed")));
          },
          background: Container(color: Colors.red),
          child: ListTile(title: Text('$item')),
        );
      },
    ));
  }
}

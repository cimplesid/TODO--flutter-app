import 'package:flutter/material.dart';
import '../../models/todo_item_model.dart';

class Details extends StatelessWidget {
  final TodoModel item;
  final Function delete;

  const Details({Key key, this.item, this.delete}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("content"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              delete(item);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.content,
              style: Theme.of(context).textTheme.display1,
            ),
            // Text(item['email']),
            SizedBox(
              height: 20.0,
            ),
            Text("Deadline: ${item.deadline}"),
            SizedBox(
              height: 10.0,
            ),

            Text("Completed: ${item.completed}"),
          ],
        ),
      ),
    );
  }
}

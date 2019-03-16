import 'package:flutter/material.dart';
import 'package:todo/models/todo_item_model.dart';
import './details.dart';
import '../../resources/db_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _value1 = false;
  String content;
  String deadline;
  String completed;

  //bool _value2 = false;
  void _value1Changed(bool value) => setState(() => _value1 = value);
  //void _value2Changed(bool value) => setState(() => _value2 = value);

  List items = [];
  void initState() {
    super.initState();
  }

  void _delete(TodoModel item) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete item"),
            content: Text("Are you sure ?"),
            actions: <Widget>[
              FlatButton(
                child: Text("cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                  child: Text("Delete"),
                  onPressed: () {
                    removeItem(item);

                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => Home()));
                  }),
            ],
          );
        });
  }

  Future<List> getItem() async {
    return DbProvider().fetchItems();
  }

  removeItem(TodoModel item) {
    setState(() {
      DbProvider().deleteItem(item.id);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.accessibility),
            onPressed: () {
              print("pressed");
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
                future: getItem(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  if (snapshot.hasError)
                    return Center(
                      child: Text("database failed to cnct"),
                    );
                  List items = snapshot.data;
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        TodoModel item = TodoModel.fromMap(items[index]);

                        return ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Details(
                                        item: item,
                                        delete: _delete,
                                      ))),
                          leading: Checkbox(
                              value: _value1, onChanged: _value1Changed),
                          title: Text(item.content),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(item.deadline),
                              SizedBox(
                                height: 5,
                              ),
                              Text(item.completed),
                            ],
                          ),
                        );
                      });
                }),
          ),
          // this is the place where t55he text field shouold be
          TextField(
            onChanged: (value) {
              setState(
                () {
                  content = value;
                  deadline = "20199-9-9";
                  completed = "no";
                },
              );
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
                hintText: 'Enter todo item',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (content == null) return;
                    TodoModel item = TodoModel(
                        content: content,
                        deadline: deadline,
                        completed: completed);
                    DbProvider().addItem(item);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Home()));
                  },
                )),
          ),
        ],
      ),
    );
  }
}

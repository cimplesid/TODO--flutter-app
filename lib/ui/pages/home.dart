import 'package:flutter/material.dart';
import './details.dart';

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _value1 = false;
  bool _value2 = false;
  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);

  List items = [
    {
      "content": "to work",
      "deadline":"2019-4-4",
      "completed":"no",
    },
    {
      "content": "to make native app",
      "deadline":"2019-5-2",
      "completed":"no",
    },
    {
      "content": "to buy ssd",
      "deadline":"2019-06-01",
      "completed":"no",
    }
  ];
    
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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return ListTile(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(
              builder: (_) => Details(item: item,)
            )),
            leading: Checkbox(value: _value1, onChanged: _value1Changed), 
            title: Text(item["content"]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item["deadline"]),
                SizedBox(height: 5,),
                Text(item["completed"])
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),

      onPressed: (){}),
    );

     
  
  }
}
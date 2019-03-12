import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Map item;

  const Details({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("content"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(item["content"], style: Theme.of(context).textTheme.display1,),
           // Text(item['email']),
            SizedBox(height: 20.0,),
            Text( "Deadline: ${item['deadline']}"),
            SizedBox(height: 10.0,),
        
            Text( "Completed: ${item['completed']}"),
          ],
        ),
      ),
    );
    
  }
}
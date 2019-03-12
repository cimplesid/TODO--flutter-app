import '../resources/constraints.dart';

class todoModel {
  final String content;
  final int id;
 final String deadline;

  final String completed;

  todoModel({
    this.content,
    this.id,
   this.deadline,

    this.completed,
  });

  todoModel.fromMap(Map<String, dynamic> parsedJson) :
        id = parsedJson[columnId],
        content = parsedJson[columnContent],
       deadline = parsedJson[columnDeadline],

        completed = parsedJson[columnCompleted];
        
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map[columnId] = id;
    map[columnContent] = content;
    map[columnDeadline]=deadline;

    map[columnCompleted] = completed;
    return map;
  }

}
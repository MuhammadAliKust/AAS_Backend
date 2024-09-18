import 'package:ammar_sajjad_backend/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskServices {
  ///Create Task
  Future createTask(TaskModel model) async {
    return await FirebaseFirestore.instance
        .collection('task')
        .add(model.toJson());
  }

  ///Update Task
  Future updateTask(TaskModel model) async {
    return await FirebaseFirestore.instance
        .collection('task')
        .doc(model.docId)
        .update({'title': model.title, 'description': model.description});
  }

  ///Delete Task
  Future deleteTask(TaskModel model) async {
    return await FirebaseFirestore.instance
        .collection('task')
        .doc(model.docId)
        .delete();
  }

  ///Mark Task as Complete

  ///Fetch All Task
  ///Fetch Completed Task
  ///Fetch InCompleted Task
}

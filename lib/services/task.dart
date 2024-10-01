import 'package:ammar_sajjad_backend/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskServices {
  ///Create Task
  Future createTask(TaskModel model) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('task').doc();
    return await FirebaseFirestore.instance
        .collection('task')
        .doc(docRef.id)
        .set(model.toJson(docRef.id));
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
  Future markTaskAsComplete(TaskModel model) async {
    return await FirebaseFirestore.instance
        .collection('task')
        .doc(model.docId)
        .update({'isCompleted': true});
  }

  ///Fetch All Task
  Stream<List<TaskModel>> fetchAllTask() {
    return FirebaseFirestore.instance.collection('task').snapshots().map(
        (taskList) => taskList.docs
            .map((task) => TaskModel.fromJson(task.data()))
            .toList());
  }

  ///Fetch Completed Task
  Stream<List<TaskModel>> fetchCompletedTask() {
    return FirebaseFirestore.instance
        .collection('task')
        .where('isCompleted', isEqualTo: true)
        .snapshots()
        .map((taskList) => taskList.docs
            .map((task) => TaskModel.fromJson(task.data()))
            .toList());
  }

  ///Fetch InCompleted Task
  Stream<List<TaskModel>> fetchInCompletedTask() {
    return FirebaseFirestore.instance
        .collection('task')
        .where('isCompleted', isEqualTo: false)
        .snapshots()
        .map((taskList) => taskList.docs
            .map((task) => TaskModel.fromJson(task.data()))
            .toList());
  }
}

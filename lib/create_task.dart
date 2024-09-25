import 'package:ammar_sajjad_backend/models/task.dart';
import 'package:ammar_sajjad_backend/services/task.dart';
import 'package:flutter/material.dart';

class CreateTaskView extends StatelessWidget {
  CreateTaskView({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Task"),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
          ),
          TextField(
            controller: descriptionController,
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  await TaskServices().createTask(TaskModel(
                      title: nameController.text,
                      isCompleted: false,
                      time: DateTime.now().millisecondsSinceEpoch,
                      description: descriptionController.text));
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: Text("Create Task"))
        ],
      ),
    );
  }
}

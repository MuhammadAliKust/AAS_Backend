import 'package:ammar_sajjad_backend/get_all_task.dart';
import 'package:ammar_sajjad_backend/models/task.dart';
import 'package:ammar_sajjad_backend/services/task.dart';
import 'package:flutter/material.dart';

class UpdateTaskView extends StatefulWidget {
  final TaskModel model;

  const UpdateTaskView({super.key, required this.model});

  @override
  State<UpdateTaskView> createState() => _UpdateTaskViewState();
}

class _UpdateTaskViewState extends State<UpdateTaskView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    titleController =
        TextEditingController(text: widget.model.title.toString());
    descriptionController =
        TextEditingController(text: widget.model.description.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Task"),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
          ),
          TextField(
            controller: descriptionController,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  await TaskServices()
                      .updateTask(TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          docId: widget.model.docId.toString()))
                      .then((val) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Message"),
                            content: Text("Task has been updated successfully"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GetAllTaskView()));
                                  },
                                  child: Text("Okay")),
                            ],
                          );
                        });
                  });
                } catch (e) {}
              },
              child: Text("Update Task"))
        ],
      ),
    );
  }
}

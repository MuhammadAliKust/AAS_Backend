import 'package:ammar_sajjad_backend/models/task.dart';
import 'package:ammar_sajjad_backend/services/task.dart';
import 'package:flutter/material.dart';

class CreateTaskView extends StatefulWidget {
  CreateTaskView({super.key});

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  bool isLoading = false;

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
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Title cannot be empty.")));
                  return;
                }
                if (descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Description cannot be empty.")));
                  return;
                }
                isLoading = true;
                setState(() {});
                try {
                  await TaskServices()
                      .createTask(TaskModel(
                          title: nameController.text,
                          isCompleted: false,
                          time: DateTime.now().millisecondsSinceEpoch,
                          description: descriptionController.text))
                      .then((val) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Message"),
                            content: Text("Task has been created successfully"),
                          );
                        });
                  });
                  isLoading = false;
                  setState(() {});
                } catch (e) {
                  isLoading = false;
                  setState(() {});
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child:
                  isLoading ? CircularProgressIndicator() : Text("Create Task"))
        ],
      ),
    );
  }
}

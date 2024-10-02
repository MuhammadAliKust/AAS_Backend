import 'package:ammar_sajjad_backend/models/task.dart';
import 'package:ammar_sajjad_backend/services/task.dart';
import 'package:ammar_sajjad_backend/update_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'create_task.dart';

class GetAllTaskView extends StatelessWidget {
  const GetAllTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get All Task"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateTaskView()));
          },
          child: Icon(Icons.add),
        ),
        body: StreamProvider.value(
          value: TaskServices().fetchAllTask(),
          initialData: [TaskModel()],
          builder: (context, child) {
            List<TaskModel> taskList = context.watch<List<TaskModel>>();
            return ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(taskList[i].title.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateTaskView(model: taskList[i])));
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Message"),
                                      content: Text(
                                          "Do you really want to complete this task?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              TaskServices().markTaskAsComplete(
                                                  taskList[i]);
                                              Navigator.pop(context);
                                            },
                                            child: Text("Yes")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("No")),
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(Icons.incomplete_circle)),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Message"),
                                      content: Text(
                                          "Do you really want to delete this task?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              TaskServices()
                                                  .deleteTask(taskList[i]);
                                              Navigator.pop(context);
                                            },
                                            child: Text("Yes")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("No")),
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  );
                });
          },
        ));
  }
}

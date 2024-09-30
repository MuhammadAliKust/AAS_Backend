import 'package:ammar_sajjad_backend/models/task.dart';
import 'package:ammar_sajjad_backend/services/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetCompletedTaskView extends StatelessWidget {
  const GetCompletedTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get Completed Task"),
        ),
        body: StreamProvider.value(
          value: TaskServices().fetchCompletedTask(),
          initialData: [TaskModel()],
          builder: (context, child) {
            List<TaskModel> taskList = context.watch<List<TaskModel>>();
            return ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(taskList[i].title.toString()),
                  );
                });
          },
        ));
  }
}

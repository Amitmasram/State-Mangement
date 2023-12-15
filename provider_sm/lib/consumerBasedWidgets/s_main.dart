import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class Task {
  String description;
  bool isCompleted;

  Task({required this.description, this.isCompleted = false});
}

class TaskListNotifier extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String description) {
    _tasks.add(Task(description: description));
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => TaskListNotifier(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using Selector to rebuild only when tasks change
            Selector<TaskListNotifier, List<Task>>(
              selector: (context, taskListNotifier) => taskListNotifier.tasks,
              builder: (context, tasks, child) {
                return Column(
                  children: tasks.map((task) {
                    return ListTile(
                      title: Text(task.description),
                      leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          Provider.of<TaskListNotifier>(context, listen: false)
                              .toggleTaskCompletion(
                                  Provider.of<TaskListNotifier>(context,
                                          listen: false)
                                      .tasks
                                      .indexOf(task));
                        },
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(height: 20),
            // Text input and button to add a new task
            Consumer<TaskListNotifier>(
              builder: (context, taskListNotifier, child) {
                return Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        // Track the description of the new task
                        // (This is just for simplicity; you might want to use a TextEditingController)
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter task description',
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Add a new task
                        taskListNotifier.addTask("New Task");
                      },
                      child: const Text('Add Task'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

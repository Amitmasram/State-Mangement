import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Task {
  String description;
  bool isCompleted;

  Task({required this.description, this.isCompleted = false});
}

class TaskListNotifier extends ChangeNotifier {
  // ignore: prefer_final_fields
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => TaskListNotifier(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
            // Using Consumer to listen to changes in TaskListNotifier
            Consumer<TaskListNotifier>(
              builder: (context, taskListNotifier, child) {
                return Column(
                  children: taskListNotifier.tasks.map((task) {
                    return ListTile(
                      title: Text(task.description),
                      leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          taskListNotifier.toggleTaskCompletion(
                              taskListNotifier.tasks.indexOf(task));
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
